class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.belongs_to :client
      t.belongs_to :document_type
      t.belongs_to :approver
      t.string :status, default: 'draft'

      t.timestamps
    end
  end
end
