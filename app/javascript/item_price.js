function inputChange(){
  let item_price = document.getElementById("item-price");
  let add_tax_price_element = document.getElementById("add-tax-price");
  let profit_element = document.getElementById("profit");

  let price_value = item_price.value;  
  let add_tax_price_value = Math.floor(price_value * 0.1);  
  let profit_value = price_value - add_tax_price_value;  

  add_tax_price_element.textContent = add_tax_price_value;  
  profit_element.textContent = profit_value;  
}
function post (){
  let item_price = document.getElementById("item-price");
  item_price.addEventListener('input', inputChange);
}

window.addEventListener('turbo:load', post);