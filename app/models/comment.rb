class Comment < ApplicationRecord
  belongs_to :todo
  belongs_to :user

  validates :text,presence: true

end
