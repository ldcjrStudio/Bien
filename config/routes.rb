Rails.application.routes.draw do
  

  resources :reviews do 
    resources :comments

  end

resources :users

# one resource, one session
resource :session


  root "reviews#index"

end
