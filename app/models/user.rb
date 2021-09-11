class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :name
  validates :birthday
  validates :phone
    with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/ } do
      validates :kana
    end
  end
end
