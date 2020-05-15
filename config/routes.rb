
Rails.application.routes.draw do
  root to: "books#index"

  get "/login", to: "users#login_form", as: "login"
  post "/login", to: "users#login"
  post "/logout", to: "users#logout", as: "logout"
  get "/users/current", to: "users#current", as: "current_user"

  resources :books #index, create, new, show, update, destroy, edit

  resources :authors do 
    resources :books, only: [:index, :new]
  end



  # reference: https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/model-logic.md 

  # resources :authors, only: [:index, :show]
end



# same as above (2)
# Rails.application.routes.draw do
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

#   # verb 'path', to: 'controller#aciton'

#   root to: "books#index"

#   # <1. Add routes that have to do with the collection of books>
#   get '/books', to: 'books#index', as: 'books'
#   # => When you receive a GET request to the /book path, go to the BooksController class and run the index action

#   # Gets a form for a new book  (new should be above of /books/:id path due to orders) => orders matter!
#   get '/books/new', to: 'books#new', as: 'new_book' 


#   # Create abook
#   post '/books', to: 'books#create' # I don't need to a nick name since I have the path, 'books' above for the same path

  

#   # <2. Routes that deal with a specific Book>
#   get '/books/:id', to: "books#show", as: 'book'

#   # Brings up the form to edit a book
#   get '/books/:id/edit', to: 'books#edit', as: 'edit_book'

#   # update an existing book
#   patch '/books/:id', to: 'books#update' # Don't need a nick name since we have the nick name for the same path above (line 16)

#   # destroy a given book
#   delete '/books/:id', to: 'books#destroy'


#   # custom (The book that you've read) => create my own method
#   patch '/books/:id/mark_read', to: 'books#mark_read', as: "book_read"
# end


# # alternative (3)
# Rails.application.routes.draw do
#   # only generate the specified routes
#   resources :books, only: [:index, :show]

#   # generates every RESTful route _except_ for POST (create) and DELETE (destroy)
#   resources :authors, except: [:create, :destroy]
# end