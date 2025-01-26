import { redirectIfNotAuthenticated } from './utils/session.js';
import { signOut } from './utils/auth.js';
import { createCargoDetailsForm } from './components/shipment/CargoDetailsForm.js';
import { initializeFormHandlers } from './components/shipment/handlers/formHandlers.js';

document.addEventListener('DOMContentLoaded', async () => {
  const session = await redirectIfNotAuthenticated();
  if (!session) return;

 
  const userCompany = document.getElementById('userCompany');
  if (userCompany && session.user.user_metadata.company_name) {
    userCompany.textContent = session.user.user_metadata.company_name;
  }

  
  const cargoDetailsStep = document.getElementById('cargoDetailsStep');
  if (cargoDetailsStep) {
    cargoDetailsStep.innerHTML = createCargoDetailsForm();
  }

  
  initializeFormHandlers();

  
  const logoutBtn = document.getElementById('logoutBtn');
  if (logoutBtn) {
    logoutBtn.addEventListener('click', handleLogout);
  }
});

async function handleLogout() {
  const { error } = await signOut();
  if (!error) {
    window.location.href = '/login.html';
  }
}