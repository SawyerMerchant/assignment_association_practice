class Post < ApplicationRecord
  belongs_to :category, optional: true

  has_many :post_users, dependent: :destroy
  has_many :authors, through: :post_users, source: :author

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  has_many :comments, dependent: :destroy
end
