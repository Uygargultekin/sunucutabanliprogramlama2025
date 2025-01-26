export function createDashboardStats(containerElement, stats) {
  containerElement.innerHTML = `
    <div class="bg-white p-6 rounded-xl shadow-lg hover:shadow-xl transition-shadow">
      <div class="flex items-center">
        <div class="p-3 bg-blue-100 rounded-full">
          <svg class="w-8 h-8 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 17l6-6-6-6"></path>
          </svg>
        </div>
        <div class="ml-4">
          <h3 class="text-gray-500 text-sm font-medium">Toplam Taşıma</h3>
          <p class="text-2xl font-bold text-gray-900">${stats.totalShipments}</p>
        </div>
      </div>
    </div>

    <div class="bg-white p-6 rounded-xl shadow-lg hover:shadow-xl transition-shadow">
      <div class="flex items-center">
        <div class="p-3 bg-green-100 rounded-full">
          <svg class="w-8 h-8 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path>
          </svg>
        </div>
        <div class="ml-4">
          <h3 class="text-gray-500 text-sm font-medium">Aktif Taşımalar</h3>
          <p class="text-2xl font-bold text-gray-900">${stats.activeShipments}</p>
        </div>
      </div>
    </div>

    <div class="bg-white p-6 rounded-xl shadow-lg hover:shadow-xl transition-shadow">
      <div class="flex items-center">
        <div class="p-3 bg-yellow-100 rounded-full">
          <svg class="w-8 h-8 text-yellow-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z"></path>
          </svg>
        </div>
        <div class="ml-4">
          <h3 class="text-gray-500 text-sm font-medium">Ortalama Değerlendirme</h3>
          <p class="text-2xl font-bold text-gray-900">${stats.averageRating}/5</p>
        </div>
      </div>
    </div>
  `;
}

export function createRecentShipments(containerElement, shipments) {
  const shipmentsHtml = shipments.map(shipment => `
    <tr class="hover:bg-gray-50 transition-colors">
      <td class="px-6 py-4 whitespace-nowrap">
        <div class="text-sm font-medium text-gray-900">${shipment.id}</div>
      </td>
      <td class="px-6 py-4 whitespace-nowrap">
        <div class="text-sm text-gray-900">${shipment.cargoType}</div>
      </td>
      <td class="px-6 py-4 whitespace-nowrap">
        <div class="text-sm text-gray-900">${shipment.departurePort}</div>
      </td>
      <td class="px-6 py-4 whitespace-nowrap">
        <div class="text-sm text-gray-900">${shipment.arrivalPort}</div>
      </td>
      <td class="px-6 py-4 whitespace-nowrap">
        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full 
          ${shipment.status === 'Aktif' ? 'bg-green-100 text-green-800' : 'bg-gray-100 text-gray-800'}">
          ${shipment.status}
        </span>
      </td>
    </tr>
  `).join('');

  containerElement.innerHTML = `
    <div class="bg-white rounded-xl shadow-lg overflow-hidden">
      <div class="px-6 py-4 border-b border-gray-200">
        <h2 class="text-xl font-semibold text-gray-800">Son Taşımalar</h2>
      </div>
      <div class="overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Yük Tipi</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Çıkış</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Varış</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Durum</th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
            ${shipmentsHtml}
          </tbody>
        </table>
      </div>
    </div>
  `;
}