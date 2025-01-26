import { redirectIfNotAuthenticated } from './utils/session.js';
import { getPartners, getPartnerShipmentHistory } from './services/partners/index.js';
import { createPartnerCard } from './components/partners/card.js';
import { createPartnerHistory } from './components/partners/history.js';

let currentHistoryDialog = null;

async function loadPartners() {
  const partnersList = document.getElementById('partnersList');
  if (!partnersList) return;

  partnersList.innerHTML = '<div class="text-center py-8">Yükleniyor...</div>';

  const { data: partners, error } = await getPartners();

  if (error) {
    partnersList.innerHTML = `
      <div class="text-center py-8 text-red-600">
        Partnerler yüklenirken bir hata oluştu. Lütfen tekrar deneyin.
      </div>
    `;
    return;
  }

  partnersList.innerHTML = partners.map(partner => createPartnerCard(partner)).join('');
}

async function showPartnerHistory(partnerId) {
  if (currentHistoryDialog) {
    currentHistoryDialog.remove();
  }

  const dialog = document.createElement('div');
  dialog.className = 'fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50';
  dialog.innerHTML = `
    <div class="bg-white rounded-lg shadow-xl w-full max-w-4xl max-h-[90vh] overflow-hidden">
      <div class="px-6 py-4 border-b border-gray-200 flex justify-between items-center">
        <h3 class="text-lg font-semibold text-gray-900">Geçmiş Taşımalar</h3>
        <button onclick="closePartnerHistory()" class="text-gray-400 hover:text-gray-500">
          <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>
      <div class="p-6 overflow-y-auto" style="max-height: calc(90vh - 4rem);">
        <div id="historyContent">
          <div class="flex justify-center">
            <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
          </div>
        </div>
      </div>
    </div>
  `;

  document.body.appendChild(dialog);
  currentHistoryDialog = dialog;

  const { data: shipments, error } = await getPartnerShipmentHistory(partnerId);
  
  const historyContent = document.getElementById('historyContent');
  if (error) {
    historyContent.innerHTML = `
      <div class="text-center text-red-600">
        Geçmiş veriler yüklenirken bir hata oluştu.
      </div>
    `;
    return;
  }

  historyContent.innerHTML = createPartnerHistory(shipments);
}

document.addEventListener('DOMContentLoaded', async () => {
  const session = await redirectIfNotAuthenticated();
  if (!session) return;
  
  await loadPartners();
});

window.showPartnerHistory = showPartnerHistory;
window.closePartnerHistory = function() {
  if (currentHistoryDialog) {
    currentHistoryDialog.remove();
    currentHistoryDialog = null;
  }
};