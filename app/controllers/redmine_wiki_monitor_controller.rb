# main controller
class RedmineWikiMonitorController < ApplicationController
  unloadable

  def index
    @totals = WikiMonitor.total_summary
  end
end
