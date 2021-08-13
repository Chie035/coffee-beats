Rails.application.routes.draw do

  namespace :admins do

  end
  namespace :admins do
    get "/top" => "homes#top", as: "top"

    resources :articles
    resources :categories, only:[:index, :create, :edit, :update]
    resources :users, only:[:index, :show, :update]
    resources :post_articles, only:[:index,:create, :show, :destroy]
    resources :questions, only:[:index, :create, :edit, :update, :destroy]
  end

    devise_for :admins, controllers: {
      sessions: 'admins/sessions'
    }


  scope module: :public do
    devise_for :users

    root to: "homes#top"
    get "/about" => "homes#about", as: "about"

    resources :articles, only:[:index, :show]
    resources :users, #param: :name, 
      only:[:show, :edit, :update] do
        collection do
        get :resign
        patch :withdraw
      end
    end
    resources :post_articles, only:[:index, :create, :show, :destroy] do
      resource :favorites, only:[:create, :destroy ]
      resources :post_comments, only:[:create, :destroy]
    end

  end

end
