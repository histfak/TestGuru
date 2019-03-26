class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @badges = current_user.badges
  end

  def show_available
    @badges_available = Badge.all
  end
end
