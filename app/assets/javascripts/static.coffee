# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

searchSub = ->
  $("#welcome").hide(1000)
  url = "/"
  form = $("#big-search")
  formData = form.serialize()
  request = jQuery.get url, formData, null, "script"
  console.log(request)

liveSearch = ->
  timer = 0
  $("#big-search-field").bind("keyup", ->
    clearTimeout(timer)
    timer = setTimeout(searchSub, 200)
  )

$(document).ready(liveSearch)
$(document).on('page:load', liveSearch)