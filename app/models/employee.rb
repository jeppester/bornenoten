class Employee < ApplicationRecord
  has_many :children
  validates :name, presence: true
end
