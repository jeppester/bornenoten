class Note < ApplicationRecord
  belongs_to :child
  validates :content, presence: true
end
