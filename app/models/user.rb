class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :resident
    validates :age
    validates :occupation
  end

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
end
