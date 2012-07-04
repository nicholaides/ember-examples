App.UserWidget = Ember.View.extend
  templateName: 'user_widget'
  classNames: ['user-widget']
  classNameBindings: ['content.isLoading']
