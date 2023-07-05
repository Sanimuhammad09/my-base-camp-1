Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  get '/sign_up', to: 'users#new'
  get '/login', to: 'users#login'
  post '/sign_up', to: 'users#create'
  post '/login', to: 'users#sign_in'
  get '/dashboard', to: 'projects#dashboard'
  get '/logout', to: 'users#logout'
  get 'allusers', to: 'users#all'
  get '/add', to: 'projects#new'
  post '/add', to: 'projects#add'
  get '/read/:id', to: 'projects#show'
  get '/delete/:id', to: 'projects#delete'
  get '/edit/:id', to: 'projects#edit'
  get 'updateRole/:id', to: 'users#updateRole'
  get '/deleteUser/:id', to: 'users#destroy'
  post 'update/:id', to: 'projects#update'
end
