class Child < ApplicationRecord
  belongs_to :employee, optional: true
  has_many :contacts, dependent: :destroy
  has_many :notes, dependent: :destroy
  validates :name, presence: true
end
