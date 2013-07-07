class Rating < ActiveRecord::Base
  attr_accessible :comment, :value

  belongs_to :hotel

  validates :hotel_id, presence: true

  validates_inclusion_of :value, :in => 1..5
  validates :comment, length: { maximum: 500 }
end
