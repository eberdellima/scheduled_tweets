# frozen_string_literal: true

# OmniauthCallbacksController documentation
class OmniauthCallbacksController < ApplicationController
  def twitter
    render plain: 'success'
  end
end
