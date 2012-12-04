Tasks = new Meteor.Collection("tasks")
Completed = new Meteor.Collection("completed")

if Meteor.is_client
  Template.tasks.tasks = -> Tasks.find()
  Template.completed.completes = -> Completed.find()
  Template.tasks.events =
          'submit #new_task': (event) ->
                  event.preventDefault()
                  Tasks.insert(name: $('#new_task_name').val())
                  $('#new_task_name').val('')
          'click .completed_task': (event) ->
                  Tasks.remove(name: $(":checkbox:checked").val())
                  Completed.insert(name: $(":checkbox:checked").val())
