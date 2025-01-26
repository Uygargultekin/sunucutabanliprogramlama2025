document.getElementById('shippingForm').addEventListener('submit', async (e) => {
  e.preventDefault();
  
  const formData = {
    cargoType: document.getElementById('cargoType').value,
    cargoWeight: document.getElementById('cargoWeight').value,
    departurePort: document.getElementById('departurePort').value,
    arrivalPort: document.getElementById('arrivalPort').value
  };

  
  const results = document.getElementById('results');
  const companiesList = document.getElementById('companiesList');
  
  results.classList.remove('hidden');
  companiesList.innerHTML = `
    <div class="p-4 border rounded">
      <h4 class="font-semibold">ABC Denizcilik</h4>
      <p class="text-sm text-gray-600">Güvenilirlik Puanı: 4.5/5</p>
      <p class="text-sm text-gray-600">Tahmini Süre: 15 gün</p>
      <p class="text-sm text-gray-600">Maliyet Tahmini: $5000</p>
    </div>
    <div class="p-4 border rounded">
      <h4 class="font-semibold">XYZ Lojistik</h4>
      <p class="text-sm text-gray-600">Güvenilirlik Puanı: 4.2/5</p>
      <p class="text-sm text-gray-600">Tahmini Süre: 18 gün</p>
      <p class="text-sm text-gray-600">Maliyet Tahmini: $4800</p>
    </div>
  `;
});