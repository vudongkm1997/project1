jQuery(document).ready(function($) {
  $("#filter-autocomplete-search").autocomplete({
    source: "/search",
    minLength: 1
  });
});
