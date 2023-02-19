Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/login', to: 'authentication#authenticate'
  post '/signup', to: 'signup#signupuser'

  get '/article_all',to: 'articlelist#showAll'
  
  get '/article/user/:user_id',to: 'users#userList'
  post '/user/:user_name/create_article', to: 'users#createArticle'
  put '/user/:article_id/edit_article', to: 'users#editArticle'
  delete '/user/:article_id/delete_article', to: 'users#deleteArticle'
end
