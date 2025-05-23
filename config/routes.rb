require "sidekiq/web"

Rails.application.routes.draw do
  # Rotas de notifications
  resources :notifications, only: [ :index, :new, :create ]

  # Autenticação
  devise_for :users

  # Rotas principais
  resources :clients
  resources :appointments
  root to: "notifications#index"  # Alterado para notifications#index

  # Monitoramento do Sidekiq (protegido por autenticação)
  authenticate :user do
    mount Sidekiq::Web => "/sidekiq"
  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
