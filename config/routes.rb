Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :pets, only: [:index, :show, :create, :update] do
      resources :comments, only: [:create, :destroy]
      resources :images, only: :create
    end
  end
end
