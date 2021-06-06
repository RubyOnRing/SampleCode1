class Document < ApplicationRecord
  belongs_to :client
  belongs_to :approver, class_name: 'Agent', optional: true
  belongs_to :document_type

  validates_uniqueness_of :client_id, scope: :document_type
end
