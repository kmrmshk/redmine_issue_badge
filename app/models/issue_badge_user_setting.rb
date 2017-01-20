class IssueBadgeUserSetting < ActiveRecord::Base
  unloadable
  belongs_to :user
  validates_presence_of :user

  def self.find_or_create_by_user_id(user_id)
    issue_badge = IssueBadgeUserSetting.where(user_id: user_id).first
    unless issue_badge
      issue_badge = IssueBadgeUserSetting.new
      issue_badge.user_id = user_id
      issue_badge.threshold_done_ratio = 100
    end
    issue_badge
  end

  def self.destroy_by_user_id(user_id)
    issue_badge = IssueBadgeUserSetting.where(user_id: user_id).first
    issue_badge.destroy if issue_badge
  end

  def enabled?
    # noinspection RubyResolve
    enabled
  end
end
