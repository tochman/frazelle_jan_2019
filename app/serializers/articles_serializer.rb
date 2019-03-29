class ArticlesSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image, :status
  # attribute :category
  belongs_to :category, serializer: CategoriesSerializer

  # def category
  #   {
  #     id: object.category.id,
  #     name: {
  #       native: object.category.name,
  #       readable: object.category.name.humanize
  #     }
  #   }
  # end
end
