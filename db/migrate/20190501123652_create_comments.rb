class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.belongs_to :gossip
      t.timestamps
      
      t.references :author, index: true
    end
  end
end
