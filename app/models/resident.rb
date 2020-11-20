class Resident < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'Adachi' },
    { id: 3, name: 'Arakawa' },
    { id: 4, name: 'Itabashi' },
    { id: 5, name: 'Edogawa' },
    { id: 6, name: 'Ota' },
    { id: 7, name: 'Katsushika' },
    { id: 8, name: 'Kita' },
    { id: 9, name: 'Koto' },
    { id: 10, name: 'Shinagawa' },
    { id: 11, name: 'Shibuya' },
    { id: 12, name: 'Shinjuku' },
    { id: 13, name: 'Suginami' },
    { id: 14, name: 'Sumida' },
    { id: 15, name: 'Setagaya' },
    { id: 16, name: 'Taito' },
    { id: 17, name: 'Chiyoda' },
    { id: 18, name: 'chuo' },
    { id: 19, name: 'Toshima' },
    { id: 20, name: 'Nakano' },
    { id: 21, name: 'Nerima' },
    { id: 22, name: 'Bunkyo' },
    { id: 23, name: 'Minato' },
    { id: 24, name: 'Meguro' },
    { id: 25, name: '-- Other --' },
]
  include ActiveHash::Associations
  has_many :users
  
end
