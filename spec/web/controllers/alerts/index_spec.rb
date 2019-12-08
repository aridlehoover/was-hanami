describe Web::Controllers::Alerts::Index do
  let(:action) { described_class.new(repository) }
  let(:params) { Hash[] }
  let(:repository) { instance_double(AlertRepository, all: alerts) }
  let(:alerts) { [alert] }
  let(:alert) { Alert.new(title: 'Tornado warning') }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq(200)
  end

  it 'exposes all alerts' do
    action.call(params)
    expect(action.exposures[:alerts]).to eq(alerts)
  end
end
