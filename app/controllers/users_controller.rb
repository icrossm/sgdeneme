class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @title =@user.name  
  end  
  
  
  def new
    @user  = User.new
    @title ="Sign Up"
  end
  
  def create
    @user=User.new
    render "new"
  end
  
  
end