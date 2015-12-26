class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  acts_as_commentable
  acts_as_votable

  belongs_to :author, class_name: 'User', foreign_key: "author_id"
  belongs_to :category

  validates :title, :description, :category, presence: true
end
