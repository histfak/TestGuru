module ApplicationHelper
  def flash_message(type)
    content_tag :p, flash[type], class: "flash #{type}" if flash[:alert]
  end
end
