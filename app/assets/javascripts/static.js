var liveSearch, searchSub;

searchSub = function() {
  var form, formData, request, url;
  url = "/";
  form = $("#big-search");
  formData = form.serialize();
  request = jQuery.get(url, formData, null, "script");
  return console.log(request, formData);
};

liveSearch = function() {
  var timer;
  timer = 0;
  return $("#big-search-field").bind("keyup", function() {
    clearTimeout(timer);
    return timer = setTimeout(searchSub, 200);
  });
};

$(document).ready(liveSearch);

$(document).on('page:load', liveSearch);