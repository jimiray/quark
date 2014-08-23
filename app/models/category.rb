class Category < ActiveRecord::Base

  has_many :articles

  validates :name, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged



end
