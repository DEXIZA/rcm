class Who < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '社員' },
    { id: 3, name: 'Ptn' },
    { id: 4, name: '全員' },
    { id: 5, name: '不特定多数' },
  ]
  include ActiveHash::Associations
  has_many :todos
 end