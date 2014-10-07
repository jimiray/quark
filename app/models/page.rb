class Page < ActiveRecord::Base

  UNDELETABLE_PAGES = %w(contact about)

  belongs_to :user

  validates :title, :body, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged


  def can_be_deleted?
    UNDELETABLE_PAGES.include?(slug) ? false : true
  end



end
