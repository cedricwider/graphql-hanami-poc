AuthorType = GraphQL::ObjectType.define do
  name 'Author'
  description 'Author of Blogs'

  field :name, types.String
  field :blogs, types[!BlogType]
end

BlogType = GraphQL::ObjectType.define do
  name 'Blog'
  description 'A Blog'

  field :title, types.String
  field :content, types.String
  field :author do
    type AuthorType
    resolve -> (obj, _, _) { AuthorRepository.find(obj.author_id) }
  end
end

QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root for this schema'

  field :blog do
    type BlogType
    argument :id, !types.ID
    resolve -> (_, args, _) { BlogRepository.find(args[:id]) }
  end

  field :author do
    type AuthorType
    argument :id, !types.ID
    resolve -> (_, args, _) { AuthorRepository.find(args[:id]) }
  end
end


BlogSchema = GraphQL::Schema.define(query: QueryType)
