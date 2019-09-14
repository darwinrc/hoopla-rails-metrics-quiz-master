class Metric < Base         
  attr_accessor :name, :type, :currency_code, :format_rounded_to, :links

  def self.all    
    options = {'Accept' => 'application/vnd.hoopla.metric-list+json'}
    response = self.get_resource('metrics', options) #@@hoopla_client.get('metrics', options)
      
    metrics = response.map do |m|
      self.deserialize(Metric, m)
    end
  end

  def self.find(id)    
    options = {'Accept' => 'application/vnd.hoopla.metric-list+json'}
    response = self.get_resource("metrics/#{id}", options)
    self.deserialize(Metric, response)
  end
end
