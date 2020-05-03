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

  def update 
    @book = Book.find_by(id: params[:id]) 

    if @book.nil? 
      head :not_found 
      return 
    elsif @book.update(
      author: params[:book][:author],
      title: params[:book][:title],
      description: params[:book][:description]
      )

      # go to the index so we can see the book in the list
      redirect_to books_path 
      return 
    else # save failed :(
      render :edit  # show the new book form view again
      return 
    end 
  end 

  def edit 
    @book = Book.find_by(id: params[:id]) 

    if @book.nil? 
      head :not_found 
      return 
    end 
  end 


  def destroy 
    book_id = params[:id]
    @book = Book.find_by(id: book_id) # I can indicate 'attribute'
    # @book = Book.find(book_id) # => this is always for id

    if @book.nil? 
      head :not_found 
      return
    end 

    @book.destory 

    redirect_to books_path
  end


  def new 
    @book = Book.new
    # @book.title = "Alice in wonderland"
    # @book.save
  end

  def create
    # raise
    # Instantiate a new book
    @book = Book.new(
      author: params[:book][:author], 
      title: params[:book][:title], 
      description: params[:book][:description]
      )

    # if save returns true, the database insert succeeds? 
    if @book.save 
      # go to the index so we can see the book in the list
      redirect_to books_path 
      return 
    else # save failed :( 
      # show the new book form view again
      render :new, :bad_request 
      return 
    end
  end

  def update 
    @book = Book.find_by(id: params[:id])
    if @book.nil? 
      head :not_found 
      return 
    elsif @book.update(
      author: params[:book][:author],
      title: params[:book][:title],
      description: params[:book][:description]
    )

    redirect_to books_path  # go to the index so we can see the book in the list 
    return 
    else # save failed :( 
      render :edit 
      return 
    end 
  end
end
