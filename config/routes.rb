Rails.application.routes.draw do

  namespace :public do
    get 'questions/index'
    get 'questions/show'
  end
  get 'questions/index'
  get 'questions/show'
  namespace :admins do

  end
  namespace :admins do
    get "/top" => "homes#top", as: "top"

    resources :articles
    resources :categories, only:[:index, :create, :edit, :update]
    resources :users, only:[:index, :show, :update]
    resources :post_articles, only:[:index,:create, :show, :destroy]
    resources :questions, only:[:index, :create, :edit, :update]
    resources :results, only:[:index, :new, :create, :show, :edit, :update]
  end

    devise_for :admins, controllers: {
      sessions: 'admins/sessions'
    }


  scope module: :public do
    devise_for :users

    root to: "homes#top"
    get "/about" => "homes#about", as: "about"

    resources :articles, only:[:index, :show]
    resources :users, only:[:show, :edit, :update] do
      resource :relationships, only:[:create, :destroy]
       get 'followings' => 'relationships#followings', as: 'followings'
       get 'followers' => 'relationships#followers', as: 'followers'
      collection do
        get :resign
        patch :withdraw
      end
    end
    resources :post_articles, only:[:index, :create, :show, :destroy] do
      resource :favorites, only:[:create, :destroy ]
      resources :post_comments, only:[:create, :destroy]
    end
    resources :questions, only:[:show, :update] do
      collection do
        get :start
        get :goal_1
        get :goal_2
      end
    end
    resources :results, only:[:index, :show]

  end

end
