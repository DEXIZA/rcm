class Todo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :urgency
  belongs_to :who

  validates :urgency_id, numericality: { other_than: 1 } 
  validates :who_id, numericality: { other_than: 1 } 


end
