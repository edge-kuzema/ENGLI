class User < ApplicationRecord
  has_many :phrases
  has_many :categories
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :recoverable, :rememberable, :trackable,
  devise :database_authenticatable, :registerable, :validatable

  mount_uploader :avatar, AvatarUploader

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

end
