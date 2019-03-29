class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @badges_achieved = current_user.badges
    @badges_available = Badge.all
  end
end
