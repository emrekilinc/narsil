require 'api_constraints'

Narsil::Application.routes.draw do
  get 'login' => 'session#login', as: 'login'
  post 'login' => 'session#authenticate'
  get 'logout' => 'session#logout'

  get 'projects' => 'project#index'
  get 'projects/new' => 'project#new'
  post 'projects/create' => 'project#create'
  get 'projects/:id' => 'project#show'
  get 'projects/edit/:id' => 'project#edit'
  post 'projects/update' => 'project#update'

  get 'errors' => 'error#index'
  get 'error/:id' => 'error#show'

  scope 'api' do
    get 'keys' => 'api#keys'
    post 'keys/create' => 'api#create'
    post 'keys/destroy/:id' => 'api#destroy'
    get 'docs' => 'api#docs'
  end

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      post 'error' => 'errors#create'
    end
  end

  get 'settings' => 'home#settings'
  get 'somethings-not-right' => 'home#error', as: 'error'
  root 'home#index'
end