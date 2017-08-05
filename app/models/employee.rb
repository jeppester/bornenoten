class Employee < ApplicationRecord
  has_many :children
  validates :name, presence: true

  mount_uploader :portrait, PortraitUploader
end
