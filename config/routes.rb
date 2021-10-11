Rails.application.routes.draw do
  resources :portfolios

  get 'about', to: 'pages#about' # route name can be anything besides 'about', as long as we point to the 'about' method
  get 'contact', to: 'pages#contact'

  resources :blogs

  root to: 'pages#home' # can be named anything besides 'home'
end
