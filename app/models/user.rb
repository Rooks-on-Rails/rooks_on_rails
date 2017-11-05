class User < ApplicationRecord
  has_many :games, dependent: false
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include Gravtastic
  gravtastic secure: true,
             default: 'monsterid',
             size: 100
end
