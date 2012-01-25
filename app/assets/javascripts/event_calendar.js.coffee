$(window).bind "load", ->
  highlight_color = "#2EAC6A"
  $(".ec-event-bg").each (ele) ->
    ele.observe "mouseover", (evt) ->
      event_id = ele.readAttribute("data-event-id")
      event_class_name = ele.readAttribute("data-event-class")
      $$(".ec-" + event_class_name + "-" + event_id).each (el) ->
        el.setStyle backgroundColor: highlight_color

    ele.observe "mouseout", (evt) ->
      event_id = ele.readAttribute("data-event-id")
      event_class_name = ele.readAttribute("data-event-class")
      event_color = ele.readAttribute("data-color")
      $$(".ec-" + event_class_name + "-" + event_id).each (el) ->
        el.setStyle backgroundColor: event_color

  $(".ec-event-no-bg").each (ele) ->
    ele.observe "mouseover", (evt) ->
      ele.setStyle color: "white"
      ele.select("a").each (link) ->
        link.setStyle color: "white"

      ele.select(".ec-bullet").each (bullet) ->
        bullet.setStyle backgroundColor: "white"

      ele.setStyle backgroundColor: highlight_color

    ele.observe "mouseout", (evt) ->
      event_color = ele.readAttribute("data-color")
      ele.setStyle color: event_color
      ele.select("a").each (link) ->
        link.setStyle color: event_color

      ele.select(".ec-bullet").each (bullet) ->
        bullet.setStyle backgroundColor: event_color

      ele.setStyle backgroundColor: "transparent"