class MessageSerializer < ActiveModel::Serializer
  attributes :id, :group_id, :body
end
