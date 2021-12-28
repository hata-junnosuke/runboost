# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, length: {maximum: 15 }
  validates :email, presence: true, uniqueness: true
  validates :profile, length: { maximum: 255 }
  has_many :blogs, dependent: :destroy
  has_many :goals, dependent: :destroy
  mount_uploader :profie_image_id, ImageUploader
end
