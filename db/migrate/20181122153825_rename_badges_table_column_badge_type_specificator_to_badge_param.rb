class RenameBadgesTableColumnBadgeTypeSpecificatorToBadgeParam < ActiveRecord::Migration[5.2]
  def change
    rename_column :badges, :badge_type_specificator, :badge_param
  end
end
