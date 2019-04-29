class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name# Un first_name, qui est un string
      t.string :last_name# Un last_name, qui est un string
      t.text :description# Un description, qui est un text
      t.string :email# Un email, qui est un string
      t.integer :age# Un age, qui est un integer
      t.timestamps
    end
  end
end
