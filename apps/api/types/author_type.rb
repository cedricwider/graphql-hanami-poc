AuthorType = GraphQL::ObjectType.define do
  name 'Author'
  description 'Author of Blogs'

  field :id, types.ID
  field :name, types.String
  field :blogs, types[!BlogType]
end
