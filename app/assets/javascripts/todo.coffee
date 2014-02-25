$("#todos").delegate ".delete", "click", ->
    node = $(this).parents(".todo")
    $.ajax "/todos/" + node.attr("id"),
        method: "DELETE"
        success: ->
            node.remove()
        error: ->
            alert "Error deleting"

$.get "/todos", (data) ->
    $("#todos").html ""
    $.each data, (index, todo) ->
        node = $("<li class='todo'></li>")
        node.text todo.text
        node.append $("<a class='delete'>DELETE</a>")
        node.attr "id", todo.id
        $("#todos").append node

$("#todoform").submit ->
    todo = $("#todoform .text").val()
    $.ajax "/todos",
        method: "POST"
        data:
            text: todo
        success: (todo) ->
            node = $("<li class='todo'></li>")
            node.text todo.text
            node.append $("<a class='delete'>DELETE</a>")
            node.attr "id", todo.id
            $("#todos").append node
            $("#todoform .text").val("")
        error: ->
            alert "Error saving"
    return false