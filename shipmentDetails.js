import { redirectIfNotAuthenticated } from './utils/session.js';
import { getShipmentDetails, updateShipmentContact, cancelShipment } from './services/shipments/details.js';
import { createCargoDetails } from './components/shipment/details/CargoDetails.js';
import { createContactForm, initializeContactForm } from './components/shipment/details/ContactForm.js';
import { formatDate } from './utils/date.js';
import { getStatusStyle, getStatusText } from './utils/shipmentStatus.js';

let shipmentId = null;

document.addEventListener('DOMContentLoaded', async () => {
  const session = await redirectIfNotAuthenticated();
  if (!session) return;

  
  const urlParams = new URLSearchParams(window.location.search);
  shipmentId = urlParams.get('id');
  
  if (!shipmentId) {
    window.location.href = '/dashboard.html';
    return;
  }

  await loadShipmentDetails();
});

async function loadShipmentDetails() {
  const { data: shipment, error } = await getShipmentDetails(shipmentId);
  if (error || !shipment) {
    console.error('Error loading shipment:', error);
    return;
  }

  
  document.getElementById('shipmentHeader').innerHTML = `
    <div class="flex justify-between items-start">
      <div>
        <h1 class="text-2xl font-bold text-gray-900">Taşıma #${shipment.id.slice(0, 8)}</h1>
        <p class="mt-1 text-sm text-gray-500">Oluşturulma: ${formatDate(shipment.created_at)}</p>
      </div>
      <div class="flex items-center space-x-4">
        ${shipment.status === 'pending' ? `
          <button id="cancelShipmentBtn" 
                  class="inline-flex items-center px-4 py-2 border border-red-300 rounded-md shadow-sm text-sm font-medium text-red-700 bg-white hover:bg-red-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500">
            <svg class="-ml-1 mr-2 h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
            İptal Et
          </button>
        ` : ''}
        <span class="px-3 py-1 rounded-full text-sm font-medium ${getStatusStyle(shipment.status)}">
          ${getStatusText(shipment.status)}
        </span>
      </div>
    </div>
  `;

  
  const cargoDetailsContainer = document.getElementById('cargoDetails');
  if (cargoDetailsContainer) {
    cargoDetailsContainer.innerHTML = createCargoDetails(shipment);
  }

  
  const contactFormContainer = document.getElementById('contactFormContainer');
  if (contactFormContainer) {
    contactFormContainer.innerHTML = createContactForm(shipment);
    initializeContactForm(async (contactData) => {
      const { error: updateError } = await updateShipmentContact(shipmentId, contactData);
      if (updateError) {
        alert('İletişim bilgileri güncellenirken bir hata oluştu.');
        return;
      }
      alert('İletişim bilgileri başarıyla güncellendi.');
    });
  }

  
  const cancelBtn = document.getElementById('cancelShipmentBtn');
  if (cancelBtn) {
    cancelBtn.addEventListener('click', handleCancelShipment);
  }
}

async function handleCancelShipment() {
  if (!confirm('Bu taşımayı iptal etmek istediğinizden emin misiniz?')) {
    return;
  }

  const cancelBtn = document.getElementById('cancelShipmentBtn');
  cancelBtn.disabled = true;
  cancelBtn.innerHTML = `
    <svg class="animate-spin -ml-1 mr-2 h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
      <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
      <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
    </svg>
    İptal Ediliyor...
  `;

  const { error } = await cancelShipment(shipmentId);
  
  if (error) {
    alert('Taşıma iptal edilirken bir hata oluştu.');
    cancelBtn.disabled = false;
    cancelBtn.innerHTML = `
      <svg class="-ml-1 mr-2 h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
      </svg>
      İptal Et
    `;
    return;
  }

  window.location.reload();
}