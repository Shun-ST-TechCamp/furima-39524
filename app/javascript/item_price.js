function price() {
  const priceInput = document.getElementById("item-price")
  if (priceInput !== null) { 
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  const profitDom = document.getElementById("profit");
  profitDom.innerHTML =  inputValue - addTaxDom.innerHTML;
  });
  }
};

window.addEventListener('turbo:load',price);
window.addEventListener('turbo:render',price);

