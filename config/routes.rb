EmberTalk::Application.routes.draw do
  get '/'       => 'examples#index'
  get '/simple' => 'examples#simple'
  get '/single' => 'examples#single'
  get '/list'   => 'examples#list'
  get '/todo'   => 'examples#todo'

  resources :users do
    get :more, on: :collection
    resources :pokes
  end
end
