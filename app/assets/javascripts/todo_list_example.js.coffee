App.Task = Ember.Object.extend
  isCompleted: false

App.TodoAppView = Ember.View.extend
  templateName: 'todo_app'

  addTask: ->
    task = App.Task.create title: @get('newTaskTitle')
    @get('tasks').pushObject task
    @set 'newTaskTitle', ''

App.TaskView = Ember.View.extend
  templateName:      'task'
  classNameBindings: ['content.isCompleted:completed']

$ ->
  tasks = [
    App.Task.create(title: "Laundry"),
    App.Task.create(title: "Dishes")
  ]

  todoList = App.TodoAppView.create tasks: tasks
  todoList.appendTo $('body')

  # Make these available in the console
  window.todoListView = todoList
  window.tasks = tasks
