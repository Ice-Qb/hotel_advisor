class Address < ActiveRecord::Base
  attr_accessible :city, :nation, :state, :street, :hotel_id
  belongs_to :hotel

  validates :hotel_id, presence: true
  validates :nation, presence: true, length: { maximum: 100 }
  validates :state, presence: true, length: { maximum: 100 }
  validates :city, presence: true, length: { maximum: 100 }
  validates :street, presence: true, length: { maximum: 100 }
end
