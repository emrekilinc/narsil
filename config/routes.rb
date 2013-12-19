require 'api_constraints'

Narsil::Application.routes.draw do
  get 'login' => 'session#login', as: 'login'
  post 'login' => 'session#authenticate'
  get 'logout' => 'session#logout'

  scope 'api' do
    get 'keys' => 'api#keys'
    post 'keys/create' => 'api#create'
    post 'keys/destroy/:id' => 'api#destroy'
    get 'docs' => 'api#docs'
  end

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      get 'error/index' => 'errors#index'
    end
  end
  
  root 'home#index'
end