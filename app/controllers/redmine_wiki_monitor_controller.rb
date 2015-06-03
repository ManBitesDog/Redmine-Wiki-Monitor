# main controller
class RedmineWikiMonitorController < ApplicationController
  unloadable

  def index
    @total = WikiMonitor.total_summary
  end
end
