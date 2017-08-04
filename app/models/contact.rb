class Contact < ApplicationRecord
  has_one :child
  validates :name, :title, presence: true
end
