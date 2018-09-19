class ApplicationController < ActionController::Base
  before_action :set_locale

  def default_url_options
    { lang: (I18n.locale if I18n.locale != I18n.default_locale) }
  end

  protected

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def after_sign_in_path_for(user)
    if user.admin?
      admin_tests_path
    else
      root_path
    end
  end
end
