class Author
  include Hanami::Entity

  attributes :name

  def blogs
    BlogRepository.by_author(self)
  end
end
