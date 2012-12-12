class CreateUsers < ActiveRecord::Migration
  def change
     create_table "users", :force => true do |t|
         t.integer  "facebook_id",                :null => false
	 t.string   "email",                      :null => false
	 t.string   "firstname"
	 t.string   "middlename"
	 t.string   "lastname"
	 t.date     "dateofbirth"
	 t.integer  "phone"
	 t.string   "gender",      :limit => 100
	 t.datetime "created_at",                 :null => false
	 t.datetime "updated_at",                 :null => false
     end
   end
end







   
    
  

