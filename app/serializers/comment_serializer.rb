class CommentSerializer < BaseSerializer
  attributes :type, :user, :content
  has_one :user
end
