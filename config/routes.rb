Rails.application.routes.draw do

  namespace :admins do
    get "/top" => "homes#top", as: "top"
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
