window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  //価格
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
  //販売手数料
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = (Math.floor(priceInput.value * 0.1))
  //販売利益
  const salesProfit = document.getElementById("profit")
  salesProfit.innerHTML = (priceInput.value - addTaxDom.innerHTML)
 })
});