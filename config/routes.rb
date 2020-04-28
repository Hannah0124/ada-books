Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # verb 'path', to: 'controller#aciton'
  get '/books', to: 'books#index'
  # => When you receive a GET request to the /book path, go to the BooksController class and run the index action

  get '/books/:id', to: "books#show"
end
