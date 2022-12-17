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

  namespace :public do
    resources :orders, only:[:new,:confirm,:complete,:index,:show,:create]
  end

  namespace :public do
    resources :cart_items, only:[:index,:create,:destroy,:destroy_all,:update]
  end

  namespace :public do
    resource :customers, only:[:edit,:show,:update]
    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
  end

  namespace :public do
    resources :items, only:[:index,:show]
  end

  namespace :public do
    resources :addreses, only:[:create,:index,:edit,:destroy,:update]
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
    resources :customer, only:[:index,:update,:edit,:update]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end