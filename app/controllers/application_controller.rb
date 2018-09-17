class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(user)
    if current_user.admin?
      admin_tests_path
    else
      root_path
    end
  end
end
