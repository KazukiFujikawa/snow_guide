Rails.application.routes.draw do
  devise_for :admins, path: "admin", controllers: {
    sessions: "admin/admins/sessions"
  }
  devise_for :users, path: "/", controllers: {
    registrations: "public/users/registrations",
    sessions: "public/users/sessions"
  }

  devise_scope :user do
   post "users/guest_sign_in", to: "public/users/sessions#guest_sign_in"
  end

  scope module: :public do
    root "home#top"
    resources :posts do
      resource :reviews, only: [ :create ]
      resources :comments, only: [ :create, :destroy ]
    end
  end

  namespace :admin do
    root "users#index"
    resources :users, only: [:destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
