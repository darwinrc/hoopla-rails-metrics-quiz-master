class Base
  include ActiveModel::Model,
      ActiveModel::Serializers::JSON
          
  attr_accessor :id, :href, :updated_at
          
  @@hoopla_client = HooplaClient.hoopla_client

  def self.get_resource(url, options)
      @@hoopla_client.get(url, options)
  end
  
  def self.update_resource(url, body ,options)
      @@hoopla_client.put(url, body, options)
  end

  def attributes=(hash)
      hash.each do |key, value|
          send("#{key}=", value)
      end
  end

  def attributes
      instance_values
  end

  def self.deserialize(model, json)
    model = model.new
    model.from_json(json.to_json)
    model.id = model.href.split('/').last

    model
  end

  def self.serialize(model)
    model.serializable_hash(except: :id)
  end
end
