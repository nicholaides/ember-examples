EmberTalk::Application.routes.draw do
  get '/' => 'follow#show'

  resources :users
end
