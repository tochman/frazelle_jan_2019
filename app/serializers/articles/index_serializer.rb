class Articles::IndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image, :status
  belongs_to :category, serializer: CategoriesSerializer
end
