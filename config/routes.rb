Rails.application.routes.draw do


  get 'profiles/index'

  get 'profiles/show'

  get 'profiles/create'

  get 'profiles/update'

  get 'profiles/destroy'

  #becoming a user
  post '/register' => 'auth#register'
  # patch '/confirm' => 'auth#confirm'
  #returning user
  post '/login' => 'auth#login'
  delete '/logout/:id' => 'auth#logout'

  resources :users, except: [:new, :edit]

  resources :books, except: [:new, :edit]

  resources :items, except: [:new, :edit]

  resources :collections, except: [:new, :edit]
end

