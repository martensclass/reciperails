class AddComments < ActiveRecord::Migration
  def change
     create_table :comments do |t|
      t.text :content
      t.integer :chef_id, :recipe_id
      t.timestamps
    end #do
  end #change
end #class