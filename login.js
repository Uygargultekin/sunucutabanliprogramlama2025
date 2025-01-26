import { signIn } from './utils/auth.js';
import { ERROR_MESSAGES } from './utils/constants.js';
import { showError, hideError } from './utils/ui.js';

document.addEventListener('DOMContentLoaded', () => {
  const loginForm = document.getElementById('loginForm');
  
  if (!loginForm) {
    console.error('Login form not found');
    return;
  }

  loginForm.addEventListener('submit', async (e) => {
    e.preventDefault();
    hideError();
    
    const email = document.getElementById('email')?.value?.trim();
    const password = document.getElementById('password')?.value;

    if (!email || !password) {
      showError('Lütfen e-posta ve şifrenizi girin.');
      return;
    }

    const submitButton = loginForm.querySelector('button[type="submit"]');
    submitButton.disabled = true;
    submitButton.textContent = 'Giriş yapılıyor...';

    try {
      const { data, error } = await signIn(email, password);
      
      if (error) {
        const errorMessage = ERROR_MESSAGES[error.message] || ERROR_MESSAGES.DEFAULT;
        showError(errorMessage);
        return;
      }

      
      window.location.href = '/dashboard.html';
    } catch (error) {
      showError(ERROR_MESSAGES.DEFAULT);
    } finally {
      submitButton.disabled = false;
      submitButton.textContent = 'Giriş Yap';
    }
  });
});