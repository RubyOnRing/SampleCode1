class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.belongs_to :entity
      t.string :email
      t.string :subdomain
      t.string :first_name
      t.string :last_name
      t.string :type

      t.timestamps
    end
  end
end
