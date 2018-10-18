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

  def change_language
    locales_names = { ru: 'Русский', en: 'English' }
    target_locale = I18n.locale == :ru ? :en : :ru
    target_locale_name = locales_names[target_locale]
    target_locale = nil if I18n.default_locale == target_locale
    link_to target_locale_name, url_for(lang: target_locale)
  end

  private

  def flash_tag(flash_type)
    flash_type_to_alert_type = { alert: :danger, notice: :info }
    alert_type = flash_type_to_alert_type[flash_type.to_sym] || :other
    alert_class = "alert alert-#{alert_type}"
    content_tag :div, flash[flash_type], class: alert_class, role: 'alert'
  end
end
