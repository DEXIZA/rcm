class Todo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :urgency
  belongs_to :roll
  belongs_to :category
  has_many :comments

  with_options presence: true do
    validates :title
    validates :content
    with_options numericality: { other_than: 1 } do
      validates :urgency_id
      validates :category_id
    end
  end


  def self.search(search)
    if search != ""
      Todo.where('content collate utf8_unicode_ci LIKE(?)', "%#{search}%")
      .or(Todo.where('title collate utf8_unicode_ci LIKE(?)', "%#{search}%"))
      # collate utf8_unicode_ciは広範囲の検索を可能にする
    else
      Todo.none
    end
  end


end
