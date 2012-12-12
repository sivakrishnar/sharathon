class UsersProductsWantedAction < ActiveRecord::Base
  attr_accessible :product_id, :user_id, :wanted_action_id
  belongs_to  :user, :primary_key => "facebook_id"
  belongs_to  :product
  belongs_to  :wanted_action
  
  def time_ago
    t2 = Time.parse self.updated_at.to_s  
    t1 = Time.now
    sec = t1 - t2
    if sec > 60
      min = (sec/60).to_i
      if min > 60
        hrs = (min/60).to_i
        if hrs > 24
          days = (hrs/24).to_i
          return (days > 1)? "#{days} days" : "#{days} day"
        else
          return (hrs >1 )? "#{hrs} hours" : "#{hrs} hour"
        end
      else
        return (min > 1)? "#{min} minutes" : "#{min} minute"
      end
    else
      return (sec > 1)? "#{sec} seconds" : "#{sec} second"
    end   
  end
  
  
  
  
  
end
