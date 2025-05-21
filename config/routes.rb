require "sidekiq/web"

Rails.application.routes.draw do
  # Autenticação
  devise_for :users

  # Rotas principais
  resources :clients
  resources :appointments
  root to: "clients#index"

  # Monitoramento do Sidekiq (protegido por autenticação)
  authenticate :user do
    mount Sidekiq::Web => "/sidekiq"
  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
