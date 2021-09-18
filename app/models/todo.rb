class Todo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :urgency
  belongs_to :who

  with_options presence: true do
    validates :title
    validates :content
  end
  validates :urgency_id, numericality: { other_than: 1 } 
  validates :who_id, numericality: { other_than: 1 } 

  def self.search(search)
    if search != ""
      Todo.where('content collate utf8_unicode_ci LIKE(?)', "%#{search}%")
      .or(Todo.where('title collate utf8_unicode_ci LIKE(?)', "%#{search}%"))
      # collate utf8_unicode_ciは広範囲の検索を可能にする
    else
      Todo.includes(:user).order('created_at DESC')
    end
  end


end
