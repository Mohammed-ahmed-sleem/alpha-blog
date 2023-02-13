Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
   root 'pages#home'
   get 'about', to: 'pages#about'
  # get 'test', to: 'articles#test'
  # resources :articles , only: [ :index, :new, :create,:update,:edit,:test]# articles/1
   delete 'articles/:id' , to: 'articles#destroy'
  # delete 'articles/:id/delete' => 'articles#destroy', as: 'articles_delete'
  # get '/articles/:id/delete' => 'articles#destroy'
  resources :articles
=begin
  REST - Representational state transfer - mapping HTTP verbs (get, post, put/patch, delete)  
  to CRUD actions 
    resources porvides REST-ful routes to rails resources 
=end
end
