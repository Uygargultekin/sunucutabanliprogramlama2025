import { signUp } from './utils/auth.js';
import { ERROR_MESSAGES, AUTH_ERRORS } from './utils/constants.js';
import { showError, hideError } from './utils/ui.js';
import { validateEmail, validatePassword, validateCompanyName } from './utils/validation.js';

document.addEventListener('DOMContentLoaded', () => {
  const registerForm = document.getElementById('registerForm');
  
  if (!registerForm) {
    console.error('Register form not found');
    return;
  }

  registerForm.addEventListener('submit', async (e) => {
    e.preventDefault();
    hideError();
    
    const email = document.getElementById('email')?.value?.trim();
    const password = document.getElementById('password')?.value;
    const companyName = document.getElementById('companyName')?.value?.trim();

    // Validation
    if (!email || !password || !companyName) {
      showError('Lütfen tüm alanları doldurun.');
      return;
    }

    if (!validateEmail(email)) {
      showError(ERROR_MESSAGES[AUTH_ERRORS.INVALID_EMAIL]);
      return;
    }

    if (!validatePassword(password)) {
      showError(ERROR_MESSAGES[AUTH_ERRORS.WEAK_PASSWORD]);
      return;
    }

    if (!validateCompanyName(companyName)) {
      showError('Firma adı en az 2 karakter olmalıdır.');
      return;
    }

    const submitButton = registerForm.querySelector('button[type="submit"]');
    submitButton.disabled = true;
    submitButton.innerHTML = `
      <svg class="animate-spin -ml-1 mr-2 h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
        <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
        <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
      </svg>
      Kayıt yapılıyor...
    `;

    try {
      const { data, error } = await signUp(email, password, companyName);
      
      if (error) {
        const errorMessage = ERROR_MESSAGES[error.message] || ERROR_MESSAGES.DEFAULT;
        showError(errorMessage);
        return;
      }

      
      alert('Kayıt başarılı! Giriş yapabilirsiniz.');
      window.location.href = '/login.html';
    } catch (error) {
      showError(ERROR_MESSAGES.DEFAULT);
    } finally {
      submitButton.disabled = false;
      submitButton.textContent = 'Kayıt Ol';
    }
  });
});