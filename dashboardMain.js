import { redirectIfNotAuthenticated } from './utils/session.js';
import { signOut } from './utils/auth.js';
import { initializeStats } from './components/dashboard/stats.js';
import { initializeShipments } from './components/dashboard/shipments.js';
import { getCompanyShipments, getShipmentStats } from './services/shipments/index.js';

async function initializeDashboard() {
  const session = await redirectIfNotAuthenticated();
  if (!session) return;

  
  const userCompany = document.getElementById('userCompany');
  if (userCompany && session.user.user_metadata.company_name) {
    userCompany.textContent = session.user.user_metadata.company_name;
  }

  
  const statsContainer = document.getElementById('dashboardStats');
  const shipmentsContainer = document.getElementById('recentShipments');

  try {
    
    const [statsResponse, shipmentsResponse] = await Promise.all([
      getShipmentStats(),
      getCompanyShipments(5)
    ]);

    if (statsResponse.error) throw statsResponse.error;
    if (shipmentsResponse.error) throw shipmentsResponse.error;

    initializeStats(statsContainer, statsResponse.data || { total_shipments: 0, active_shipments: 0, average_rating: 0 });
    initializeShipments(shipmentsContainer, shipmentsResponse.data || []);
  } catch (error) {
    console.error('Error initializing dashboard:', error);
    
    if (statsContainer) {
      statsContainer.innerHTML = '<div class="text-red-600 p-4">Veriler yüklenirken bir hata oluştu.</div>';
    }
  }

  
  const logoutBtn = document.getElementById('logoutBtn');
  if (logoutBtn) {
    logoutBtn.addEventListener('click', handleLogout);
  }
}

async function handleLogout() {
  const { error } = await signOut();
  if (!error) {
    window.location.href = '/login.html';
  }
}


document.addEventListener('DOMContentLoaded', initializeDashboard);