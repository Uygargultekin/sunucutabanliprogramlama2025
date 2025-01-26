import { redirectIfNotAuthenticated } from './utils/session.js';
import { getPartnerProfile } from './services/partners/profile.js';
import { createPartnerOverview } from './components/partners/profile/Overview.js';
import { createPartnerReferences } from './components/partners/profile/References.js';
import { createPartnerCertifications } from './components/partners/profile/Certifications.js';
import { createShipmentHistory } from './components/partners/profile/ShipmentHistory.js';
import { createPartnerCharts, initializeCharts } from './components/partners/profile/Charts.js';

document.addEventListener('DOMContentLoaded', async () => {
  const session = await redirectIfNotAuthenticated();
  if (!session) return;

  const urlParams = new URLSearchParams(window.location.search);
  const partnerId = urlParams.get('id');
  
  if (!partnerId) {
    window.location.href = '/partners.html';
    return;
  }

  await loadPartnerProfile(partnerId);
});

async function loadPartnerProfile(partnerId) {
  const container = document.getElementById('partnerProfile');
  if (!container) return;

  const { data: partner, error } = await getPartnerProfile(partnerId);
  
  if (error) {
    container.innerHTML = `
      <div class="text-center py-8 text-red-600">
        Partner bilgileri yüklenirken bir hata oluştu.
      </div>
    `;
    return;
  }

  container.innerHTML = `
    ${createPartnerOverview(partner)}
    ${createPartnerCharts(partner)}
    ${createPartnerReferences(partner.partner_references)}
    ${createPartnerCertifications(partner.partner_certifications)}
    <div class="mt-6">
      ${createShipmentHistory(partner.shipments)}
    </div>
  `;


  initializeCharts(partner);
}