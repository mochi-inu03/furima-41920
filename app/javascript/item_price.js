const price = () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit"); 

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const tax = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = `${tax}`;
    console.log(addTaxDom.innerHTML);

    const profit = Math.floor(inputValue - tax);
    profitDom.innerHTML = `${profit}`;
    console.log(profitDom.innerHTML);
  }); 
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
