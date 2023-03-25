# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'projects#index'

  resources :projects, except: :destroy do
    resources :comments
  end

  get 'signup', to: 'users#new'
  resources :users, only: [:create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
