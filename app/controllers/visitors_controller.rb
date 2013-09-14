class VisitorsController < ApplicationController

  def new
    @chart = Chart.basic_line_chart
  end

end
