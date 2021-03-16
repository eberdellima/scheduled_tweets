# frozen_string_literal: true

# OmniauthCallbacksController documentation
class OmniauthCallbacksController < ApplicationController
  def twitter
    auth_info = auth.info
    auth_credentials = auth.credentials

    twitter_account = Current.user.twitter_accounts.where(username: auth_info.nickname).first_or_initialize
    twitter_account.update(
      name: auth_info.name,
      image: auth_info.image,
      token: auth_credentials.token,
      secret: auth_credentials.secret
    )

    redirect_to root_path, notice: 'Successfully connected your account!'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
