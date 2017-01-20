class IssueBadgeController < ApplicationController
  unloadable
  layout 'base'
  helper :issues
  include IssuesHelper
  menu_item :issues

  def index
    # noinspection RubyResolve
    all_issues = Issue.visible.open.where(["assigned_to_id = ? and done_ratio < ?", ([User.current.id] + User.current.group_ids), Setting.plugin_redmine_issue_badge['threshold_done_ratio']])
    @all_issues_count = all_issues.count
    render action: '_issue_badge', layout: false
  end

  def load_badge_contents
    # noinspection RubyResolve
    @limited_issues = Issue.visible.open.where(["assigned_to_id = ? and done_ratio < ?", ([User.current.id] + User.current.group_ids), Setting.plugin_redmine_issue_badge['threshold_done_ratio']]).limit(5)
    render action: '_issue_badge_contents', layout: false
  end
end
