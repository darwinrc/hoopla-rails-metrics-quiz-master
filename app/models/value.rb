class Value < Base
  attr_accessor :metric, :owner, :value, :user

  def self.all(metric_values_link)    
      options = {'Accept' => 'application/vnd.hoopla.metric-value-list+json'}
      response = self.get_resource(metric_values_link, options)
      
      response.select{|v| v['owner']['kind'] == 'user'}.map do |v|
        value = self.deserialize(Value, v)      
        value.user = User.find(value.owner['href'])

        value
      end
  end

  def self.find(metric_values_link)    
    options = {'Accept' => 'application/vnd.hoopla.metric-value+json'}
    response = self.get_resource(metric_values_link, options)
    self.deserialize(Value, response)
  end

  def self.update(metric_values_link, new_value)
    options = {'Accept' => 'application/vnd.hoopla.metric-value+json'}
    serialized_value = self.serialize(new_value)
    response = self.update_resource(metric_values_link, serialized_value, options)
    self.deserialize(Value, response)
  end
end
