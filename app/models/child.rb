class Child < ApplicationRecord
  belongs_to :employee, optional: true
  has_many :contacts, dependent: :destroy
  has_many :notes, dependent: :destroy
  validates :name, presence: true

  mount_uploader :portrait, PortraitUploader

  accepts_nested_attributes_for :contacts, allow_destroy: true, reject_if: :required_contact_fields_missing?

  private

  def required_contact_fields_missing?(attributes)
    if attributes['name'].present? && attributes['title'].present?
      false
    elsif attributes['id'].present?
      attributes['_destroy'] = 1
      false
    else
      true
    end
  end
end
