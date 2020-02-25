class Property < ApplicationRecord
  validates :name, presence: true
  validates :rent, presence: true
  validates :address, presence: true
  validates :age, presence: true
  validates :notes, presence: true

  has_many :stations, dependent: :destroy, inverse_of: :property
  accepts_nested_attributes_for :stations, reject_if: :reject_stations

    def reject_stations(attributes)
      attributes['station_name'].blank?
    end
end