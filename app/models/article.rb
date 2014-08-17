class Article < ActiveRecord::Base

  belongs_to :user
  has_many :comments

  has_and_belongs_to_many :tags

  extend FriendlyId
  friendly_id :title, use: :slugged

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
