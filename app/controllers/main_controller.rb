# frozen_string_literal: true

# MainController documentation
class MainController < ApplicationController
  def index
    flash.now[:notice] = "Welcome notice!"
  end
end
