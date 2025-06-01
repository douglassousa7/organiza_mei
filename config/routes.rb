Rails.application.routes.draw do
  resources :notifications do
    member do
      patch :mark_as_sent
    end
  end

  root "notifications#index"
end
