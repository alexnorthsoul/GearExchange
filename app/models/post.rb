class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  acts_as_commentable
  acts_as_votable

  belongs_to :author, class_name: 'User'
  belongs_to :category

  validates :title, :description, presence: true
end
