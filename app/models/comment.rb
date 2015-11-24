class Comment < ActiveRecord::Base
  include ActsAsCommentable::Comment
  acts_as_votable

  belongs_to :commentable, polymorphic: true
  #belongs_to :user

  default_scope -> { order('created_at ASC') }

  validates :title, :comment, presence: true

end
