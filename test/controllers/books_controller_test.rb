require "test_helper"

describe BooksController do
  # it "does a thing" do
  #   value(1+1).must_equal 2
  # end

  describe "index action" do 
    it "should get index" do 
      get books_path
  
      must_respond_with :success # 200 => nominal case 
      
      # must_respond_with :redirect # 3XX
      # must_respond_with :missing # 404
      # must_respond_with :error #4-5XX
  
      # must_redirect_to "/"
      # must_redirect_to root_path #path name 
      # must_redirect_to_controller: 'book', action: 'index'
    end 
  end

  describe "show action" do 
    before do 
      @book = Book.create(title: "hello world")
    end

    it "should get a valid book" do 
      # Arrange 
      valid_book_id = @book.id

      # Act 
      get "/books/#{valid_book_id}" 
      # get "/books/1"  # same as above (Arrange & Act)

      # Assert 
      must_respond_with :success  
    end 

    it "should respond with not_found (404) for invalid ids" do 
      # Arrange 
      invalid_book_id = 999 

      # Act 
      get "/books/#{invalid_book_id}"

      # Assert 
      must_respond_with :not_found
    end
  end
end
