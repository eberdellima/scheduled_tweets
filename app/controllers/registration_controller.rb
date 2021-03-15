# frozen_string_literal: true

# Registration Controller documentation
class RegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      return redirect_to root_path, notice: 'Successfully created account!'
    end

    render :new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
