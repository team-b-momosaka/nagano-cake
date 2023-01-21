Rails.application.routes.draw do
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

      namespace :admin do
    root to: "homes#top"
      resources :items, only: [:index,:new,:create,:show,:edit,:update]
      resources :genres, only: [:index,:create,:edit,:update, :show]
      resources :customers,only: [:index,:show,:edit,:update]
      resources :orders,only: [:index,:show,:update]
      resources :order_details, only: [:update]
     end
  # 顧客用
  # URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  get "about" => "public/homes#about"
  scope module: :public do
 root to: "homes#top"
  resources :items, only: [:index, :show]
  resources :customers, only: [:show, :edit, :update ]
  patch "customers/unsbuscribe" => "customers#unsubscribe"
  resources :cart_items, only: [:index,:update,:show]
  resources :orders, only: [:new, :index, :show, :create]
  resources :addresses, only: [:index, :create, :edit, :update, :destoy]
  end
end