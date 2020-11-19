class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :age_id, numericality: { other_than: 1 } 
    validates :resident_id, numericality: { other_than: 1 } 
    validates :occupation_id, numericality: { other_than: 1 } 
  end

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :occupation_id
  belongs_to :age_id
  belongs_to :resident_id
end
