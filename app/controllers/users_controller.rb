class UsersController < ApplicationController
  def login_form 
    @user = User.new
  end
  
  def login 
    username = params[:user][:username]
    user = User.find_by(username: username) 

    # if user 
    #   session[:user_id] = user.id 
    #   flash[:success] = "Successfully logged in as returning user #{username}"
    # else 
    #   user = User.create(username: username) 
    #   session[:user_id] = user.id 
    #   flash[:success] = "Successfully logged in as new user #{username}"
    # end

    # redirect_to root_path
    # return

    # Chris's verison
    if user.nil? 
      user = User.new(username: params[:user][:username]) 

      if !user.save 
        flash[:error] = "Unable to login"
        redirect_to root_path 
        return 
      end  

      flash[:welcome] = "Welcome #{user.username}" 
    else  
      flash[:welcome] = "Welcome back #{user.username}"
    end

    session[:user_id] = user.id 
    redirect_to root_path
  end 

  def current 
    @current_user = User.find_by(id: session[:user_id])
    unless @current_user 
      flash[:error] = "You must be logged in to see this page"
      redirect_to root_path 
      return
    end
  end

  def logout 
    if session[:user_id] 
      user = User.find_by(id: session[:user_id])

      unless user.nil? 
        session[:user_id] = nil
        flash[:notice] = "Goodby #{user.username}"

      else 
        session[:user_id] = nil 
        flash[:notice] = "Error Unknown User"
      end 

    else  
      flash[:error] = "You must be logged in to logout"
    end 

    redirect_to root_path 
  end


  def current 
    @user = User.find_by(id: session[:user_id]) 

    if @user.nil? 
      flash[:error] = "You must be logged in to view this page"
      redirect_to root_path 

      return
    end
  end
end
