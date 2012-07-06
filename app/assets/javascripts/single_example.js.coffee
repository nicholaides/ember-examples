$ ->
  userWidget = App.UserWidgetView.create()
  userWidget.appendTo $('body')

  user = App.User.create()
  userWidget.set 'content', user

  user.loadFrom '/users/dave.json'
