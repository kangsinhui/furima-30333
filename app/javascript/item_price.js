window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = (Math.floor(inputValue/10))
    const addTaxDomValue = addTaxDom.value;
    console.log(addTaxDomValue);

  const profitDom = document.getElementById("profit");
    const Value_result = (inputValue/10)
    console.log(Value_result);
  profitDom.innerHTML = (Math.floor(inputValue - Value_result))
    const profitDomValue = profitDom.value;
    console.log(profitDomValue);
  
  })

});
