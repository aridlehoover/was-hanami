RSpec.describe Web::Controllers::Alerts::Create, type: :action do
  let(:action) { described_class.new(repository) }
  let(:params) { Hash[alert: { title: 'Tornado warning' }] }
  let(:repository) { instance_double(AlertRepository) }

  before { allow(repository).to receive(:create) }

  it 'creates a new alert' do
    action.call(params)

    expect(repository).to have_received(:create).with(params[:alert])
  end

  it 'redirects to the alerts listing' do
    response = action.call(params)

    expect(response[0]).to eq(302)
    expect(response[1]['Location']).to eq('/alerts')
  end
end
