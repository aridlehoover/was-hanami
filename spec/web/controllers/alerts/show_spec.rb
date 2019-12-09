RSpec.describe Web::Controllers::Alerts::Show, type: :action do
  let(:action) { described_class.new(repository) }
  let(:params) { Hash[id: id] }
  let(:id) { '123' }
  let(:repository) { instance_double(AlertRepository) }
  let(:alert) { Alert.new(title: 'Tornado warning') }

  before do
    allow(repository).to receive(:find).and_return(alert)

    action.call(params)
  end

  it 'finds the alert' do
    expect(repository).to have_received(:find).with(id)
  end

  it 'exposes the alert' do
    expect(action.exposures[:alert]).to eq(alert)
  end
end
