class SessionsController < Devise::SessionsController
  after_action :show_flash, only: :create

  private

  def show_flash
    flash[:notice] = "#{t('hello')}, #{current_user.name}!"
  end
end
