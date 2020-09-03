function profitCalc(){
  const price = document.getElementById("item-price")
  const profit = document.getElementById("profit")
      value = price.value * 0.9
      profit.innerHTML = Math.floor(value)
}
window.addEventListener('keyup', profitCalc)