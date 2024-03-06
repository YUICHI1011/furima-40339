window.addEventListener('turbo:load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = Math.floor(priceInput.value * 0.1);
    const addTaxDom = document.getElementById("add-tax-price");
    const profit = Math.floor(priceInput.value - inputValue);
    console.log(priceInput) 
    const profitDom = document.getElementById("profit");
    addTaxDom.innerHTML = inputValue;
    profitDom.innerHTML = profit;
    console.log(inputValue);
  
  });
});