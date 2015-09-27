class PostSerializer < ActiveModel::Serializer
  attributes :id, :id, :title, :body, :is_draft, :created_at
end
