window.App = Ember.Application.create()

App.UserWidgetView = Ember.View.extend
  templateName:      'user_widget'
  classNames:        ['user-widget']
  classNameBindings: ['content.isLoading']

App.PokeView = Ember.View.extend
  tagName:           'input'
  attributeBindings: ['type', 'value', 'disabled']
  type:              'button'

  disabled: (->
    @getPath 'content.isPoked'
  ).property 'content.isPoked'

  value: (->
    if @getPath 'content.isPoked' then 'Poked' else 'Poke'
  ).property 'content.isPoked'

  click: ->
    @get('content').poke()


App.User = Ember.Object.extend
  fullName: (->
    @get('firstName') + " " + @get('lastName')
  ).property 'firstName', 'lastName'

  poke: ->
    @set 'isPoked', true
    $.post @get('pokesPath')

App.User.reopenClass
  createMany: (usersListAttributes)->
    usersListAttributes.map (userAttributes)=>
      @create userAttributes

  loadMany: (url, callback)->
    $.getJSON url, (response)=>
      users = @createMany response.users
      callback users

  loadOne: (url)->
    user = @create(isLoading: true)
    $.getJSON url, (userAttributes)=>
      user.setProperties userAttributes
      user.set 'isLoading', false
    user


App.UsersController = Ember.ArrayController.extend
  content: []

  load: ->
    App.User.loadMany '/users', (users)=>
      @pushObjects users

  loadMore: ->
    App.User.loadMany '/users/more', (users)=>
      @pushObjects users


App.UserListView = Ember.View.extend
  templateName: 'user_list'
  showMore: (event)->
    event.preventDefault()
    @get('content').loadMore()

