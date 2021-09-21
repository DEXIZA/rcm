class Roll < ActiveHash::Base
  self.data = [
    { id: 1, name: 'Ptn' },
    { id: 2, name: 'Ptn主任' },
    { id: 3, name: '社員' },
    { id: 4, name: '副店長' },
    { id: 5, name: '店長' },
  ]
  include ActiveHash::Associations
  has_many :todos
  has_many :users
 end