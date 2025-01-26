import { redirectIfNotAuthenticated } from './utils/session.js';
import { signOut } from './utils/auth.js';
import { getCompanyShipments } from './services/shipments/index.js';
import { PORTS } from './constants/ports.js';
import { formatDate } from './utils/date.js';
import { createShipmentFilters, initializeFilters } from './components/shipments/filters.js';

let currentFilters = {};

async function initializeShipments() {
  const session = await redirectIfNotAuthenticated();
  if (!session) return;

  
  const userCompany = document.getElementById('userCompany');
  if (userCompany && session.user.user_metadata.company_name) {
    userCompany.textContent = session.user.user_metadata.company_name;
  }

  
  const filtersContainer = document.createElement('div');
  filtersContainer.innerHTML = createShipmentFilters();
  document.querySelector('main').insertBefore(filtersContainer, document.getElementById('shipmentsList'));
  
  initializeFilters(async (filters) => {
    currentFilters = filters;
    await loadShipments();
  });

  
  await loadShipments();

  
  const logoutBtn = document.getElementById('logoutBtn');
  if (logoutBtn) {
    logoutBtn.addEventListener('click', handleLogout);
  }
}

async function loadShipments() {
  const container = document.getElementById('shipmentsList');
  if (!container) return;

  
  container.innerHTML = `
    <div class="p-8 text-center">
      <div class="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-gray-900"></div>
      <p class="mt-2 text-gray-600">Yükleniyor...</p>
    </div>
  `;

  const { data: shipments, error } = await getCompanyShipments(currentFilters);
  
  if (error) {
    container.innerHTML = `
      <div class="p-8 text-center text-red-600">
        Veriler yüklenirken bir hata oluştu.
      </div>
    `;
    return;
  }

  displayShipments(shipments || []);
}

function displayShipments(shipments) {
  const container = document.getElementById('shipmentsList');
  if (!container) return;

  if (shipments.length === 0) {
    container.innerHTML = `
      <div class="p-8 text-center">
        <p class="text-gray-500">Bu kriterlere uygun taşıma bulunamadı.</p>
        <a href="/new-shipment.html" class="mt-4 inline-flex items-center text-blue-600 hover:text-blue-700">
          Yeni taşıma oluştur
          <svg class="ml-1 h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3" />
          </svg>
        </a>
      </div>
    `;
    return;
  }

  container.innerHTML = `
    <table class="min-w-full divide-y divide-gray-200">
      <thead class="bg-gray-50">
        <tr>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
            ID / Tarih
          </th>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
            Yük Bilgisi
          </th>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
            Rota
          </th>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
            Partner
          </th>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
            Durum
          </th>
          <th class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
            İşlemler
          </th>
        </tr>
      </thead>
      <tbody class="bg-white divide-y divide-gray-200">
        ${shipments.map(shipment => `
          <tr class="hover:bg-gray-50 transition-colors cursor-pointer" 
              onclick="window.location.href='/shipment-details.html?id=${shipment.id}'">
            <td class="px-6 py-4 whitespace-nowrap">
              <div class="text-sm font-medium text-gray-900">${shipment.id.slice(0, 8)}</div>
              <div class="text-sm text-gray-500">${formatDate(shipment.created_at)}</div>
            </td>
            <td class="px-6 py-4 whitespace-nowrap">
              <div class="text-sm text-gray-900">${shipment.cargo_type}</div>
              <div class="text-sm text-gray-500">${shipment.cargo_weight} kg</div>
            </td>
            <td class="px-6 py-4 whitespace-nowrap">
              <div class="text-sm text-gray-900">
                ${PORTS.TR.find(p => p.id === shipment.departure_port)?.name || shipment.departure_port}
              </div>
              <div class="text-sm text-gray-500">→</div>
              <div class="text-sm text-gray-900">
                ${PORTS.EU.find(p => p.id === shipment.arrival_port)?.name || shipment.arrival_port}
              </div>
            </td>
            <td class="px-6 py-4 whitespace-nowrap">
              ${shipment.logistics_companies ? `
                <div class="text-sm text-gray-900">${shipment.logistics_companies.name}</div>
                <div class="text-sm text-gray-500">
                  <span class="text-yellow-500">★</span> ${shipment.logistics_companies.rating.toFixed(1)}
                </div>
              ` : '-'}
            </td>
            <td class="px-6 py-4 whitespace-nowrap">
              <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full 
                ${getStatusStyle(shipment.status)}">
                ${getStatusText(shipment.status)}
              </span>
            </td>
            <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
              <a href="/shipment-details.html?id=${shipment.id}" 
                 class="text-blue-600 hover:text-blue-900">
                Detaylar
              </a>
            </td>
          </tr>
        `).join('')}
      </tbody>
    </table>
  `;
}

function getStatusStyle(status) {
  const styles = {
    pending: 'bg-yellow-100 text-yellow-800',
    active: 'bg-green-100 text-green-800',
    completed: 'bg-blue-100 text-blue-800',
    cancelled: 'bg-red-100 text-red-800'
  };
  return styles[status] || styles.pending;
}

function getStatusText(status) {
  const texts = {
    pending: 'Beklemede',
    active: 'Aktif',
    completed: 'Tamamlandı',
    cancelled: 'İptal Edildi'
  };
  return texts[status] || status;
}

async function handleLogout() {
  const { error } = await signOut();
  if (!error) {
    window.location.href = '/login.html';
  }
}


document.addEventListener('DOMContentLoaded', initializeShipments);