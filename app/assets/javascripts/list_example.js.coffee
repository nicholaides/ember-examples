#= require ./advanced_user_widget_assets

$ ->
  usersController = App.UsersController.create()
  usersController.load()

  userList = App.UserListView.create(content: usersController)
  userList.appendTo $('body')

  # Make these available in the console
  window.usersController = usersController
  window.userList = userList
