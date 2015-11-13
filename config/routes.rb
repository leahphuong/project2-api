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
  # don't need the profiles id
  # resources :profiles, except: [:new, :edit]
  get "/profiles", to: "profiles#show"
  post "/profiles", to: "profiles#create"
  patch "/profiles", to: "profiles#update"
  delete "/profiles", to: "profiles#destroy"

end

