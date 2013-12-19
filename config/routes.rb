Narsil::Application.routes.draw do
  get 'login' => 'session#login'
  
  root 'home#index'
end