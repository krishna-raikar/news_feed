class PostSerializer < BaseSerializer
  attributes :type, :content, :user, :comments
  has_many :comments
  has_one :user
end
