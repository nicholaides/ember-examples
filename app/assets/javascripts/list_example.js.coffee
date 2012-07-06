$ ->
  usersController = App.UsersController.create()
  usersController.load()

  userList = App.UserListView.create(content: usersController)
  userList.appendTo $('body')
