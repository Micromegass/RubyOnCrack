class SessionsController < ApplicationController
before_action :private_access, only: [:destory]
before_action :public_access, except: [:destroy]

  def create
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    sign_in(user)
    flash[:success] = "Welcome #{current_user.name}, you successfully logged in!"
    redirect_to root_path
  else
    render :new
  end
end

def destroy
  sign_out
  flash[:success] = "Successfully logged out. Come back soon friend!"
  redirect_to root_path
end

end
