class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :phone
      t.integer :user_id
      t.text :optional

      t.timestamps
    end
  end
end
