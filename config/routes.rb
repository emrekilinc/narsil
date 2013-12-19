require 'api_constraints'

Narsil::Application.routes.draw do
  get 'login' => 'session#login', as: 'login'
  post 'login' => 'session#authenticate'

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      get 'errors' => 'errors#index'
    end
  end
  
  root 'home#index'
end