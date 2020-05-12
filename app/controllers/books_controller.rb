# BOOKS = [
#   { title: "Hidden Figures", author: "Margot Lee Shetterly", description: "Great book about Nasa pioneers"},
#   { title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz", description: "Classic Book"},
#   { title: "Kindred", author: "Octavia E. Butler", description: "A mystery"}
# ]


class BooksController < ApplicationController
  def index 
    if params[:author_id] 
      # now the book has access to the @author
      @author = Author.find_by(id: params[:author_id])
      @books = @author.books 
    else 
      @books = Book.all
    end
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



  def new 
    if params[:author_id] 
      author = Author.find_by(id: params[:author_id])
      @book = author.books.new
    else 
      @book = Book.new
    end
    # @book.title = "Alice in wonderland"
    # @book.save
  end


  def create
    # raise
    # Instantiate a new book
    # @book = Book.new(
    #   author: params[:book][:author], 
    #   title: params[:book][:title], 
    #   description: params[:book][:description]
    #   )

    # same as above
    @book = Book.new(book_params)

    # if save returns true, the database insert succeeds? 
    if @book.save 
      # go to the index so we can see the book in the list
      redirect_to root_path
      return 
    else # save failed :( 
      # show the new book form view again
      render :new, :bad_request # show the new book from view again
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

  def update 
    @book = Book.find_by(id: params[:id])
    if @book.nil? 
      head :not_found 
      return 
    elsif @book.update(book_params)

      redirect_to books_path  # go to the index so we can see the book in the list 
      return 
    else # save failed :( 
      render :edit 
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

    @book.destroy 

    redirect_to books_path
  end

  

  private 

  def book_params 
    #  require(highest-level param).permit(specific params)
    return params.require(:book).permit(:title, :description, :author_id, genre_ids: [])

  end
end
