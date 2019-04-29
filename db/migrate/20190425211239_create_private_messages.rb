class CreatePrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :private_messages do |t|
      t.text :content
      t.timestamps

      t.references :sender, index: true
      t.references :recipient, index: true
    end
  end
end
