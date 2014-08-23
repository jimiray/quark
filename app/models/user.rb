require 'role_model'

class User < ActiveRecord::Base

  include RoleModel

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :invitable

  has_many :articles

  validates :name, presence: true
  validates :email, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  roles :admin, :author

end
