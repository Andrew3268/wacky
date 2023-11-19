var inputId   = 'filter-search';
var itemsData   = 'filter-value';
var displaySet = false;
var displayArr = [];

function getDisplayType(element) {
  var elementStyle = element.currentStyle || window.getComputedStyle(element, "");
  return elementStyle.display;
}

document.getElementById(inputId).onkeyup = function() {
  var searchVal = this.value.toLowerCase();
  var filterItems = document.querySelectorAll('[' + itemsData + ']');

  for(var i = 0; i < filterItems.length; i++) {
    if (!displaySet) {
      displayArr.push(getDisplayType(filterItems[i]));
    }

    filterItems[i].style.display = 'none';

    if(filterItems[i].getAttribute('filter-value').indexOf(searchVal) >= 0) {
      filterItems[i].style.display = displayArr[i];   
    }
  }
  
  displaySet = true;
}