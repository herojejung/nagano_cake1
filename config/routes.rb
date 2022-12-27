Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations,:passwords] , controllers: {
  sessions: "admin/sessions"
}

  root to: "homes#top"

  namespace :admin do
    root to: 'homes#top'
    get "destroy/admin/session" => "admin#sign_out"
  end

  namespace :public do
    root to: "homes#top"
    get "home/about" => "homes#about", as: "about"
    get "destroy_customer_session" => "customers#sign_out"
  end

  scope module: :public do
    resources :orders, only: %i[new index show create] 
    post '/orders/confirm' => 'orders#confirm', as: 'confirm'
    get '/orders/complete' => 'orders#complete', as: 'complete'
  end

  scope module: :public do
    delete '/cart_items/destroy_all' => "cart_items#destroy_all", as: 'destroy_all'
    resources :cart_items, only: %i[index create destroy update]
  end

  namespace :public do
    resource :customers, only:[:edit,:show,:update]
    get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
  end

  scope module: :public do
    resources :items, only: %i[index show create]
  end

  namespace :public do
    resources :addresses, only:[:create,:index,:edit,:destroy,:update]
  end

  namespace :admin do
    resources :items, only:[:create,:index,:show,:edit,:destroy,:update,:new]
  end

  namespace :admin do
    resources :genres, only:[:create,:index,:edit,:update]
  end

  namespace :admin do
    resources :orders, only:[:show,:update]
  end

  namespace :admin do
    resources :customer, only:[:index,:show,:edit,:update]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end