class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'worker' },
    { id: 3, name: 'student' },
    { id: 4, name: 'other' }
]
  include ActiveHash::Associations
  has_many :users
  
end
