# frozen_string_literal: true

# MainController documentation
class MainController < ApplicationController
  def index
    return @user = User.find_by(id: session[:user_id]) unless session[:user_id].nil?

    flash.now[:notice] = 'Welcome notice!'
  end
end
