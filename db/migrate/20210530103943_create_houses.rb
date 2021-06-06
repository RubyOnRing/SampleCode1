class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.belongs_to :contract
      t.string :house_number
      t.string :street
      t.string :city
      t.string :post_code
      t.string :status, default: :draft
      t.string :max_people

      t.timestamps
    end
  end
end
