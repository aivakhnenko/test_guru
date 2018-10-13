module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
  
  def flash_messages
    flash.keys.map(&method(:flash_message)).join(' ').html_safe
  end

  def flash_message(flash_type)
    content_tag :p, flash[flash_type], class: "flash #{flash_type}" if flash[flash_type]
  end
end
