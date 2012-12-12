class User < ActiveRecord::Base
  attr_accessible :dateofbirth, :email, :firstname, :lastname, :phone, :facebook_id, :middlename, :gender
end
