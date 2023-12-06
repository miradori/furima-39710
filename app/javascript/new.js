window.addEventListener('turbo:load', () => {
    const price = document.getElementById("item-price");
    price.addEventListener("input", () => {
      const inputPrice = price.value;
    // let price_check = parseFloat(price);
    // if (isNaN(price_check)) {
    //   document.getElementById("add-tax-price").innerText = "NaN";
    //   document.getElementById("profit").innerText = "NaN";
    //   return;
    // }
      const tax = 0.1;
      const add_tax_price = (Math.floor(inputPrice * tax));
      const profit = (Math.floor(inputPrice - add_tax_price));

      const taxText = document.getElementById("add-tax-price");
      const profitText = document.getElementById("profit");
      taxText.innerHTML = add_tax_price;
      profitText.innerHTML = profit;
    });
});