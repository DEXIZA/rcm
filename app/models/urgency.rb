class Urgency < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '未着手' },
    { id: 3, name: '進行中' },
    { id: 4, name: '完了' },
    { id: 5, name: '中止' },
  ]
  include ActiveHash::Associations
  has_many :todos
 end