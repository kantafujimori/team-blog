Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#index'
  resources :tweets, only: [:index, :show, :new, :create, :edit, :destroy, :update] do
    resources :comments, only: [:create]
  end
end
