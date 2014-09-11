class Article < ActiveRecord::Base

  attr_accessor :image

  belongs_to :user
  belongs_to :category

  has_many :comments

  validates :title, :body, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_attached_file :image

  def published?
    return false if published_at.nil?
    published_at < Time.now
  end

  def publish!
    update_attribute(:published_at, Time.now)
  end

  def unpublish!
    update_attribute(:published_at, nil)
  end

end
