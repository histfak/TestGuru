class Admin::GistsController < Admin::AdminController
  def index
    @gists = Gist.order(:created_at)
  end
end
