class DropIphoneRatings < ActiveRecord::Migration
  def up
  	drop_table :iphone_ratings 
  end

  
end
