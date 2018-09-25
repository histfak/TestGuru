module ApplicationHelper
  FLASH_TYPES = { notice: 'alert-primary', alert: 'alert-warning', error: 'alert-danger' }.freeze

  def flash_type(type)
    FLASH_TYPES[type.to_sym]
  end

  def gist_url_hash(url)
    url.split('/').last
  end
end
