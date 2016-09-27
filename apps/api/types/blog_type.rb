BlogType = GraphQL::ObjectType.define do
  name 'Blog'
  description 'A Blog'

  field :id, types.ID
  field :title, types.String
  field :content, types.String
  field :author do
    type AuthorType
    resolve -> (obj, _, _) { AuthorRepository.find(obj.author_id) }
  end
end
