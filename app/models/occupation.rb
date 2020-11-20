class Occupation < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'worker' },
    { id: 3, name: 'student' },
    { id: 4, name: '-- Other --' }
]
  include ActiveHash::Associations
  has_many :users
  
end
