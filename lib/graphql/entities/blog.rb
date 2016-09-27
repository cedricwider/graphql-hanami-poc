class Blog
  include Hanami::Entity

  attributes :title, :content, :author_id
end
