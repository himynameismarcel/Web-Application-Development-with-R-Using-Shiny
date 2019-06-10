shinyjs.buttonClick = function(params){
  // boilerplate code
  var defaultParams = {
    color : "black",
    size : "medium"
  };
  
  params = shinyjs.getParams(params, defaultParams);
  
  // rest of code
  var elem = document.getElementById('selection');
  elem.innerHTML = document.getElementById('year').value;
  elem.style.color = params.color;
  elem.style.fontSize = params.size;
}

// note that it is not necessary to include the script-tag around the
// javascript in this file
