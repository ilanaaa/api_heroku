class CreateIpadRatings < ActiveRecord::Migration
  def change
    create_table :ipad_ratings do |t|
      t.string :date 
      t.integer :onestar 
      t.integer :twostar 
      t.integer :threestar 
      t.integer :fourstar 
      t.integer :fivestar 

      t.timestamps
    end
  end
end
