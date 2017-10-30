Rails.application.routes.draw do
  get 'settings/product_management'

  resources :categories do
    resources :products, only: [:show, :edit, :index]
  end
  resources :products, only: [:new, :create]

  devise_for :users
  resource :profile, only: [:edit, :update]
  resources :users, except: :show do
    member do
      patch :resend_invite
    end
  end

  [:teams, :regions, :list_roles].each do |list_items|
    resources list_items, except: :show
  end

  root "dashboard#index"
end
