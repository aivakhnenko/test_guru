module SessionsHelper
  def flash_message(flash_type)
    content_tag :p, flash[flash_type], class: "flash #{flash_type}" if flash[flash_type]
  end
end
