class AddThresholdDoneRatioToIssueBadgeUserSettings < ActiveRecord::Migration
  def up
    add_column :issue_badge_user_settings, :threshold_done_ratio, :integer
  end
end
