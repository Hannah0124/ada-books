require "test_helper"

describe BooksController do
  # it "does a thing" do
  #   value(1+1).must_equal 2
  # end

  it "responds to index" do 
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
