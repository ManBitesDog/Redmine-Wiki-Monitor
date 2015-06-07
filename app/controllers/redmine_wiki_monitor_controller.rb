# main controller
class RedmineWikiMonitorController < ApplicationController
  unloadable

  def index
    @totals = WikiMonitor.total_summary
    @by_users = WikiMonitor.by_users
  end
end
