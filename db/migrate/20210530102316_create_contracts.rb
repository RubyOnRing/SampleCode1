class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.belongs_to :entity
      t.string :name
      t.integer :duration
      t.string :code

      t.timestamps
    end
  end
end
