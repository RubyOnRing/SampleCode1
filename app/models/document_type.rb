class DocumentType < ApplicationRecord
  belongs_to :entity
  has_many :documents
end
