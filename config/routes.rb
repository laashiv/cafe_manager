Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#index"

  resources :cart_items

  resources :users

  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session

  get "/cdash" => "cdash#index"
  post "/cdash" => "cdash#create"

  get "/contact" => "contact#index"
  post "/contact" => "contact#popup"

  get "/about" => "about#index"

  post "/cart_items" => "cart_items#coupancheck", as: :coupon_path

  resources :menus
  resources :orders

  delete "/menu_items/:id" => "menu_items#destroy"
  get "/menu_items" => "menu_items#index"
  get "/active-menu" => "menus#active_menu"
  post "/menu_items" => "menu_items#create"
  put "/menu_items/:id" => "menu_items#update"
  get "/orders" => "orders#index", as: :orders_report
  post "/link_menu_items/:id1/:id2" => "link_menu_items#create"
  delete "/link_menu_items/:id1/:id2" => "link_menu_items#destroy"
  put "/orders/:id" => "orders#update"
  get "/users-list" => "menus#userslist"
  get "clerks-list" => "menus#clerkslist"
  put "/users/:id" => "users#update"
  get "sales" => "menus#sales", as: :report
  post "datewise_search" => "menus#datewise_search"
  post "datewise_search_orders" => "orders#datewise_search"
  get "invoice" => "orders#invoice"
end
