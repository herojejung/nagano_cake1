Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations,:passwords] , controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    root to: 'homes#top'
    get "destroy/admin/session" => "admin#sign_out"
  end

  namespace :admin do
    resources :items, only:[:create,:index,:show,:edit,:destroy,:update,:new]
  end

  namespace :admin do
    resources :genres, only:[:create,:index,:edit,:update]
  end

  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end