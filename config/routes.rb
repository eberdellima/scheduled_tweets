# frozen_string_literal: true

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root to: 'main#index'

  get '/about', to: 'about#index'

  get '/password', to: 'passwords#edit', as: :edit_password
  patch '/password', to: 'passwords#update', as: :update_password
  get 'password/reset', to: 'password_reset#new'
  post 'password/reset', to: 'password_reset#create'
  get 'password/reset/edit', to: 'password_reset#edit'
  patch 'password/reset/update', to: 'password_reset#update'

  get '/sign-up', to: 'registration#new'
  post '/sign-up', to: 'registration#create'

  get '/sign-in', to: 'sessions#new'
  post '/sign-in', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/twitter/callback', to: 'omniauth_callbacks#twitter'
end
