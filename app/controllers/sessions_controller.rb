# frozen_literal_strings: true

# SessionsController documentations
class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      return redirect_to root_path, notice: 'Logged in successfully!'
    end

    flash[:notice] = 'Invalid email or password!'
    render :new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end
end
