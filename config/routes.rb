Rails.application.routes.draw do
  resources :portfolios, except: [:show]

  get 'react-portfolio-items', to: 'portfolios#react'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show' # add alias for route and override default value
  get 'about', to: 'pages#about' # route name can be anything besides 'about', as long as we point to the 'about' method
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  root to: 'pages#home' # can be named anything besides 'home'
end
