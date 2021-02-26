class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day


  with_options presence: true do
    validates :name, :description, :image
    validates :price, format: { with:/\A[0-9]+\z/ , message: '半角数字を使用してください'}, numericality: {only_interger: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'には300~9999999の半角数字を使用してください' }
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :prefectures_id
    validates :day_id
  end

end
