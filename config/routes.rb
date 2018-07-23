# frozen_string_literal: true

Rails.application.routes.draw do
  resources :memberships
  resources :projects do
    resources :shots do
      post 'images', to: 'images#create'
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
