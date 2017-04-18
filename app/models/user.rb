class User < ApplicationRecord
  include PublicActivity::Model
  tracked
  has_many :phrases
  has_many :categories

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthablerail
  devise :database_authenticatable, :registerable, :validatable, :rememberable, :recoverable

  mount_uploader :avatar, AvatarUploader

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

end
