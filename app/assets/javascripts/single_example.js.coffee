#= require ./advanced_user_widget_assets

$ ->
  userWidget = App.UserWidgetView.create()
  userWidget.appendTo $('body')

  user = App.User.loadOne '/users/dave.json'
  userWidget.set 'content', user

  # Make these available in the console
  window.userWidget = userWidget
  window.user = user
