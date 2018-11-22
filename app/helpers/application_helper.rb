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

  def languages
    I18n.available_locales - [I18n.locale]
  end

  def minutes(value)
    return '—' if value == 0
    t('general.minutes', count: value)
  end

  private

  FLASH_TYPE_TO_ALERT_TYPE = { alert: :danger, notice: :info }.freeze
  DEFAULT_ALERT_TYPE = :other.freeze

  def flash_tag(flash_type)
    alert_type = FLASH_TYPE_TO_ALERT_TYPE.fetch(flash_type.to_sym, DEFAULT_ALERT_TYPE)
    alert_class = "alert alert-#{alert_type}"
    content_tag :div, flash[flash_type].html_safe, class: alert_class, role: 'alert'
  end
end
