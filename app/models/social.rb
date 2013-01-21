class Social < ActiveRecord::Base
  
  def self.create_with_omniauth(auth)
    create! do |social|
      social.provider = auth["provider"]
      social.uid = auth["uid"]
      social.name = auth["info"]["name"]
    end
  end

end
