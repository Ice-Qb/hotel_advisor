class Hotel < ActiveRecord::Base
  attr_accessible :breakfast, :description, :price, :title, :star_rating, :image
  belongs_to :user
  has_many :ratings, :dependent => :destroy
  has_one :address, :dependent => :destroy
  mount_uploader :image, ImageUploader

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 700 }
  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, 
            :numericality => { :greater_than_or_equal_to => 0.01, 
            	                 :less_than_or_equal_to => 100000.00 }
  validates :star_rating, 
            :numericality => { :greater_than_or_equal_to => 1.00, 
                               :less_than_or_equal_to => 5.00 }

  # def self.avg
  #   ratings = self.ratings
  #   if ratings.count != 0
  #     self.star_rating = (ratings.map(&:value).sum.to_f / ratings.count).round(2)
  #   else
  #     self.star_rating = 1.00
  #   end                              
  # end                            
end
