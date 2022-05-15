class AboutController < ApplicationController

  def index
    authorize self
    # require_user!
  end
end
