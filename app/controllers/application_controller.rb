# frozen_string_literal: true

# ApplicationController documentation
class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) unless session[:user_id].nil?
  end
end
