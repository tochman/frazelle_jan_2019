# frozen_string_literal: true

class CategoriesSerializer < ActiveModel::Serializer
  attributes :id, :name

  def name
    {
      native: object.name,
      readable: object.name.humanize
    }
  end
end
