module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
  
  def flash_messages
    tags = flash.keys.map { |flash_type| flash_tag(flash_type) }
    safe_join(tags)
  end

  def flash_message(flash_type)
    flash_tag(flash_type) if flash[flash_type]
  end

  private

  def flash_tag(flash_type)
    content_tag :p, flash[flash_type], class: "flash #{flash_type}"
  end
end
