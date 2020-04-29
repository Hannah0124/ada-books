# BOOKS = [
#   { title: "Hidden Figures", author: "Margot Lee Shetterly", description: "Great book about Nasa pioneers"},
#   { title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz", description: "Classic Book"},
#   { title: "Kindred", author: "Octavia E. Butler", description: "A mystery"}
# ]


class BooksController < ApplicationController
  def index 
    @books = Book.all
  end 

  def show 
    # raise
    book_id = params[:id].to_i
    @book = Book.find_by(id: book_id)

    if @book.nil?
      head :not_found # it sends back an error code 404
      return 
    end 

  end
end
