require_relative 'author_type'
require_relative 'blog_type'

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
