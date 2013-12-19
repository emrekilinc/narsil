Narsil::Application.routes.draw do
  get 'login' => 'session#login', as: 'login'
  post 'login' => 'session#authenticate'
  
  root 'home#index'
end