RSpec.describe Blog do

  it 'can be instantiated with attributes' do
    blog = Blog.new(title: 'blog title', content: 'blog content', author_id: 1)

    expect(blog.title).to eq 'blog title'
    expect(blog.content).to eq 'blog content'
    expect(blog.author_id).to eq 1
  end

end
