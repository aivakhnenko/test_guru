module BadgesHelper
  def minutes(value)
    return '—' if value == 0
    t('general.minutes', count: value)
  end
end
