class CreateIphoneRatings < ActiveRecord::Migration
  def change
    create_table :iphone_ratings do |t|

      t.timestamps
    end
  end
end
