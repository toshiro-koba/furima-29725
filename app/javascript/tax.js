function taxCalc(){
  const price = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price")
      value = price.value * 0.1
      tax.innerHTML = Math.floor(value)
}
window.addEventListener('keyup', taxCalc)
