class CreateDocumentTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :document_types do |t|
      t.belongs_to :entity
      t.string :code
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
