require "test_helper"

describe Book do

  describe 'validation' do 
    before do 
      author = Author.new(name: 'test author')
      @book = Book.new(title: 'test book', author: author)
    end

    it 'is valid when all fields are present' do 
      # Act 
      result = @book.valid? 

      # Assert 
      expect(result).must_equal true
    end

    it 'is invalid without a title' do 
      # Arrange 
      @book.title = nil 

      # Act 
      result = @book.valid? 

      # Assert 
      expect(result).must_equal false 
      expect(@book.errors.messages).must_include :title
      expect(@book.errors.messages[:title]).must_include "can't be blank"
    end

    it 'fails validation when the title already exists' do 
      # Arrange 
      Book.create(title: @book.title, author: @book.author)

      # Act 
      result = @book.valid? 

      # Assert 
      expect(result).must_equal false 
      expect(@book.errors.messages[:title]).must_include "has already been taken"
    end
  end


  describe 'relations' do
    describe 'author' do 
      it "allows access to author" do 
        # author = Author.find_by(name: "Sandi Metz")  # using fixtures
        author = authors(:metz) # same as above
        book = Book.new(title: "test book", author: author)
        expect(book.author).must_equal author
      end


      it 'can set the author through "author"' do
        # Create two models
        # create!: means create but if I fail, stop everything!

        # author = Author.create!(name: "test author")
        author = authors(:butler) # same as above
        
        book = Book.new(title: "test book")
  
        # Make the models relate to one another (making one table talk to another)
        book.author = author
  
        # author_id should have changed accordingly (check that Active Record recognizes the relationship)
        expect(book.author_id).must_equal author.id
      end

      it 'can set the author through "author_id"' do
        # Create two models
        author = Author.create!(name: "test author")
        book = Book.new(title: "test book")
  
        # Make the models relate to one another
        book.author_id = author.id
  
        # author should have changed accordingly
        expect(book.author).must_equal author
      end
    end

    describe 'genre' do 
      it 'only considers a genre added to a book when we have shoveld it' do
        genre = Genre.create!(name: 'test fiction')
        author = Author.new(name: "test author")
        book = Book.new(title: "Some test fiction", author: author) 

        expect(book.genres.include?(genre)).must_equal false 
        book.genres << genre
        expect(book.genres.include?(genre)).must_equal true
      end
    end
  end
end
