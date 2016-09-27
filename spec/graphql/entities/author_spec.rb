RSpec.describe Author do
  it 'can be initialised with a hash' do
    author = Author.new(name: 'Edgar Allan Poe')
    expect(author.name).to eq 'Edgar Allan Poe'
  end
end
