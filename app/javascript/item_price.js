const price = () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const commissionDom = document.getElementById("add-tax-price");
    const commission = Math.floor(inputValue * 0.1)
    commissionDom.innerHTML = commission;
    const profitDom = document.getElementById("profit");
    const profit = inputValue - commission;
    profitDom.innerHTML = profit;
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);