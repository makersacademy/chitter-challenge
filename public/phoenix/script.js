function show_hide_el(el_id) {
  var selected_el = document.getElementById(el_id);
  if(selected_el.style.display == "none") {
    selected_el.style.display = "block";
  }
  else {
    selected_el.style.display = "none";
  }
}
