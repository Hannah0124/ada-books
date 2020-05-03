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


  describe "create action" do
    it "can create a book (database)" do
      book_hash = {
        book: {
          title: "Practical Object Oriented Programming in Ruby",
          author: "Sandi Metz",
          description: 'A look at how to design object-oriented systems'
        }
      }

      expect {
        post books_path, params: book_hash
      }.must_differ 'Book.count', 1
  
      must_redirect_to books_path

      expect(Book.last.title).must_equal book_hash[:book][:title]
      expect(Book.last.author).must_equal book_hash[:book][:author]
      expect(Book.last.description).must_equal book_hash[:book][:description]

    end

    it "will not create a book with invalid params" do
        # fill this in when we implement validations next week
    end
  end


  describe "update action" do 
    before do 
      Book.create(title: "We're all wonders", author: " R.J. Palacio", description: "Good kids book")
    end

    let (:new_book_hash) {
      {
        book: {
          title: "A Wrinkle in Time",
          author: "Madeleine L'Engle",
          description: "A fabulous adventure",
        },
      }
    }

    it "will update a model with a valid post request" do 
      id = Book.first.id
      expect {
        patch book_path(id), params: new_book_hash
      }.wont_change "Book.count" # Since we just modified, count won't change

      must_redirect_to books_path 

      book = Book.find_by(id: id)
      expect(book.title).must_equal new_book_hash[:book][:title]
      expect(book.author).must_equal new_book_hash[:book][:author]
      expect(book.description).must_equal new_book_hash[:book][:description]
    end

    it "will respond with not_found for invalid ids" do 
      id = -1 

      expect {
        patch book_path(id), params: new_book_hash
      }.wont_change "Book.count"

      must_respond_with :not_found
    end

    it "will not update if the params are invalid" do
      # This test will be examined when we cover validations next week
    end

  end
end
