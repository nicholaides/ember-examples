EmberTalk::Application.routes.draw do
  get '/' => 'follow#show'

  resources :users do
    resources :pokes
  end
end
