$ ->
  App.UserListView = Ember.View.extend
    templateName: 'user_list'
    showMore: (event)->
      event.preventDefault()

      App.User.loadMore (users)=>
        @get('content').pushObjects users

  App.usersController = []

  userList = App.UserListView.create
    content: App.usersController

  userList.appendTo $('body')

  $.getJSON '/users', (response)->
    users = response.users.map (atts)->
      App.User.create atts
    App.usersController.pushObjects users
