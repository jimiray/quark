require 'role_model'

class User < ActiveRecord::Base

  include RoleModel

  include Invitable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :invitable, :async

  has_many :articles

  validates :name, presence: true
  validates :email, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  roles :admin, :editor, :author, :user

  scope :invited, -> { where("encrypted_password=''") }
  scope :accepted, -> { where("encrypted_password !=''") }

end
