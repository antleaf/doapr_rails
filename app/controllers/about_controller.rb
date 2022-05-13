class AboutController < ApplicationController

  def index
    require_user!
  end
end
