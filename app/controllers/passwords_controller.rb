# frozen_string_literal: true

# PasswordController documentation
class PasswordsController < ApplicationController
  before_action :require_user_logged_in!

  def edit; end

  def update
    return redirect_to root_path, notice: 'Password changed successfully!' if Current.user.update(password_params)

    render :edit
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
