# collection :users do
#   entity     User
#   repository UserRepository
#
#   attribute :id,   Integer
#   attribute :name, String
# end

collection :blogs do
  entity      Blog
  repository  BlogRepository

  attribute :id,          Integer
  attribute :title,       String
  attribute :content,     String
  attribute :author_id,   Integer
end

collection :authors do
  entity     Author
  repository AuthorRepository

  attribute :id,    Integer
  attribute :name,  String
end
