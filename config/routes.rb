Rails.application.routes.draw do

  #becoming a user
  post '/register' => 'auth#register'
  # patch '/confirm' => 'auth#confirm'
  #returning user
  post '/login' => 'auth#login'
  delete '/logout/:id' => 'auth#logout'

  resources :users, except: [:new, :edit]

  resources :books, except: [:new, :edit]

  resources :items, except: [:new, :edit]
end
6
