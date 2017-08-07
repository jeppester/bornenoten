class Contact < ApplicationRecord
  TITLES = %w(mother father foster_mother foster_father)

  has_one :child
  validates :name, :title, presence: true
  validates :title, inclusion: TITLES
end
