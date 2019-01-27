class BaseSerializer < ActiveModel::Serializer
  attributes :type

  def type
    object.class.to_s
  end
end
