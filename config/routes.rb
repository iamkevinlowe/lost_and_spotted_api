Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pets, only: [:index, :show, :create, :update] do
    resources :comments, only: [:create, :destroy]
    resources :images, only: :create
  end
end
