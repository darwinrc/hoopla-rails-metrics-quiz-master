class MetricsController < ApplicationController
  def index        
      @metrics = Metric.all
  end

  def show
      @metric = Metric.find(params[:id])
      metric_values_link = (@metric.links.select{|l| l['rel'] == 'list_metric_values'}).first['href']
      @metric_values = Value.all(metric_values_link)
  end
end
