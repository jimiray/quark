class Category < ActiveRecord::Base

  attr_accessor :image

  has_many :articles

  validates :name, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :image

end
