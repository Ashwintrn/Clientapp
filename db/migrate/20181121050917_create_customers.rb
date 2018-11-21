class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :uid
      t.string :email
      t.string :status

      t.timestamps
    end
  end
end
