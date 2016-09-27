class BlogRepository
  include Hanami::Repository

  def self.by_author(author)
    query do
      where(author_id: author.id)
    end.all
  end
end
