class Category < ApplicationRecord
  validates_presence_of :description

  # Scopes
  scope :order_by_description, -> { order(:description) }
end
