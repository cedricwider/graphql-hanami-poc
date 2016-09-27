require_relative '../../../../apps/api/controllers/queries_controller/create'

RSpec.describe Api::Controllers::QueriesController::Create do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
