# require "test_helper"

# describe UsersController do
#   it 'can get the login form' do
#     get login_path

#     must_respond_with :success
  
#   end

#   describe "logging in" do
#     it 'can login a new user' do

#     ######## MOVED TO test_helper.rb as HELPER METHOD
#     # Arrange
#       # user_hash = {
#       #   user: {
#       #     username: "Grace Hopper"
#       #   }
#       # }

#       # expect(
#       # # Act
#       # post login_path, params: user_hash
#       # ).must_differ "User.count", 1
#       user = nil
#       expect{
#         user = login()
#       }.must_differ "User.count", 1

      
#       # Assert
#       must_respond_with :redirect
#       # user = User.find_by(username: user_hash[:user][:username])

#       expect(user).wont_be_nil
#       expect(session[:user_id]).must_equal user.id
#       expect(user.username).must_equal "Grace Hopper"
#     end

#     it "can login and exisitng user" do
#       user = User.create(username: "Ed sheren")
#       expect{
#         login(user.username)
#       }.wont_change "User.count"

#       p User.all
#       expect(session[:user_id]).must_equal user.id
#     end
#   end


#   describe 'logout' do
#     it 'can logout a logged in user' do
#     # Arrange
#     login()
#     expect(session[:user_id]).wont_be_nil

#     #Act
#     post logout_path

#     expect(session[:user_id]).must_be_nil

#     end
#   end

#   describe "current user " do
#     it 'can return the page if the user is logged in' do
#       # Arrange
#       login()

#       # Act
#       get current_user_path

#       # Assert
#       must_respond_with :success
#     end

#     it "redirects us back if the user is not logged in" do
#       # Act
#       get current_user_path
#       # Assert 
#       must_respond_with :redirect
#       expect flash[:error].must_equal  "You must be logged in to view this page"
#     end
#   end
# end


require "test_helper"

describe UsersController do
  it "can get the login form" do 
    get login_path 
    must_respond_with :success 
  end 

  describe "loggin in" do 
    it "can login a new user" do 

      # # Arrange
      # user_hash = {
      #   user: {
      #     username: "Grace Hopper"
      #   }
      # }

      # expect {
      #   # Act 
      #   post login_path, params: user_hash
      # }.must_differ "User.count", 1
      
      # must_respond_with :redirect 
      # user = User.find_by(username: user_hash[:user][:username])

      # expect(user).wont_be_nil 
      # expect(session[:user_id]).must_equal user.id 
      # expect(user.name).must_equal user_hash[:user][:username]

      # same as above 
      user = nil # becuz of the scope issue, create a variable here first. 

      expect {
        user = login()
      }.must_differ "User.count", 1

      must_respond_with :redirect 

      expect(user).wont_be_nil 
      expect(session[:user_id]).must_equal user.id 
      expect(user.username).must_equal "Grace Hopper"
      # Arrange 
      # perform_login # from test_helper

      # Act 
      # get current_user_path 

      # Assert 
      # must_respond_with :success
    end

    it "can login an existing user" do 
      user = User.create(username: "Ed Sheeran")

      expect {
        login(user.username)
      }.wont_change "User.count"

      expect(session[:user_id]).must_equal user.id 
    end
  end


  describe 'logout' do
    it 'can logout a logged in user' do
      # Arrange
      login()
      expect(session[:user_id]).wont_be_nil

      #Act
      post logout_path

      expect(session[:user_id]).must_be_nil
    end
  end

    describe "current user " do
      it 'can return the page if the user is logged in' do
        # Arrange
        login()

        # Act
        get current_user_path

        # Assert
        must_respond_with :success
      end

    it "redirects us back if the user is not logged in" do
      # Act
      get current_user_path
      
      # Assert 
      must_respond_with :redirect
      expect flash[:error].must_equal  "You must be logged in to view this page"
    end
  end
end
