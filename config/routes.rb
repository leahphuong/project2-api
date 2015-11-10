Rails.application.routes.draw do


  #becoming a user
  post '/register' => 'auth#register'
  # patch '/confirm' => 'auth#confirm'
  #returning user
  patch '/login' => 'auth#login'
  delete '/logout/:id' => 'auth#logout'

  resources :users, except: [:new, :edit]

  resources :books, except: [:new, :edit]

  resources :collections, except: [:new, :edit] do
    resources :items, except: [:new, :edit]
  end

  resources :profiles, except: [:new, :edit]
end

