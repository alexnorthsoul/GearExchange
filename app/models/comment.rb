class Comment < ActiveRecord::Base
  include ActsAsCommentable::Comment
  acts_as_votable

  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: 'User', foreign_key: "user_id"

  default_scope -> { order('created_at ASC') }

  validates :title, :comment, presence: true

end
