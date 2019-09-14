  class User < Base
    attr_accessor :first_name, :last_name, 
                  :email, :confirmed_email, 
                  :birthday, :anniversary
          
    def self.find(user_link)    
      options = {'Accept' => 'Accept: application/vnd.hoopla.user+json'}
      response = self.get_resource(user_link, options)

      self.deserialize(User, response)      
    end
  end
