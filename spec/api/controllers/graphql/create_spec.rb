require_relative '../../../../apps/api/controllers/graphql/create'

RSpec.describe Api::Controllers::Graphql::Create do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
