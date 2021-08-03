Rails.application.routes.draw do

  namespace :admins do
    get "/top" => "homes#top", as: "top"
    
    resources :articles
    resources :users, only:[:index, :show, :edit, :update]
    resources :post_articles, only:[:index, :show, :destroy]
    resources :questions, only:[:index, :create, :edit, :update, :destroy]
  end
  
    devise_for :admins, controllers: {
      sessions: 'admins/sessions'
    }


  scope module: :public do
    devise_for :users
    
    root to: "homes#top"
    get "/about" => "homes#about", as: "about"
  end

end
