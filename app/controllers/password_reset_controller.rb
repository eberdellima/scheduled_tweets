# frozen_string_literal: true

# PasswordResetController documentation
class PasswordResetController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])

    PasswordMailer.with(user: @user).reset.deliver_later if @user.present?

    redirect_to root_path, notice: 'If an account with that email was found, we have sent a link to reset you password'
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier
    redirect_to password_reset_path, notice: 'Your token is invalid! Please try again'
  end

  def update
    begin
      @user = User.find_signed!(!params[:token], purpose: 'password_reset')
    rescue ActiveSupport::MessageVerifier
      redirect_to password_reset_path, notice: 'Your token is invalid! Please try again'
    end

    return render :edit unless @user.update(password_params)

    redirect_to sign_in_path, notice: 'Your password was reset successfully. Please sign in.'
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
