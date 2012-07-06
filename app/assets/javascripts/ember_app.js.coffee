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
  loadFrom: (url)->
    @set 'isLoading', true
    $.getJSON url, (userAttributes)=>
      @setProperties userAttributes
      @set 'isLoading', false

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

App.UsersController = Ember.ArrayController.extend
  content: []

  load: ->
    @loadFrom '/users'

  loadMore: ->
    @loadFrom '/users/more'

  loadFrom: (url)->
    $.getJSON url, (response)=>
      users = App.User.createMany(response.users)
      @pushObjects users

App.UserListView = Ember.View.extend
  templateName: 'user_list'
  showMore: (event)->
    event.preventDefault()
    @get('content').loadMore()

