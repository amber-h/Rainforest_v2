class UsersController < ApplicationController
  layout 'static', :only => [:new]
  
  def new
  	@user= User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		redirect_to products_url, :notice => "Signed Up!"
  	else 
  		render "new"
  	end
  end

  def show
    @user= User.find(params[:id])
  end
end
