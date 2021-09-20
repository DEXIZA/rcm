class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'イベント' },
    { id: 3, name: '問題' },
    { id: 4, name: '提案' },
    { id: 5, name: 'やらなければいけないこと' },
  ]
  include ActiveHash::Associations
  has_many :todos
 end