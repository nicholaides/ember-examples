EmberTalk::Application.routes.draw do
  get '/'     => 'examples#single'
  get '/list' => 'examples#list'

  resources :users do
    get :more, on: :collection
    resources :pokes
  end
end
