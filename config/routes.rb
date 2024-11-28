# frozen_string_literal: true

Rails.application.routes.draw do
  get 'calculate', to: 'calculations#new'
  post 'calculate', to: 'calculations#calculate'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
