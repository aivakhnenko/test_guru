module Admin::BadgesHelper
  def badge_types_locale
    Badge.badge_types.map { |type| [type.first, t("activerecord.values.badge.badge_type.#{type.first}")] }
  end
end
