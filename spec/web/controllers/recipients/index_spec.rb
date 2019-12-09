describe Web::Controllers::Recipients::Index do
  let(:action) { described_class.new(repository) }
  let(:params) { Hash[] }
  let(:repository) { instance_double(RecipientRepository, all: recipients) }
  let(:recipients) { [recipient] }
  let(:recipient) { Recipient.new(channel: 'email', address: 'dorothy@oz.com') }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq(200)
  end

  it 'exposes all recipients' do
    action.call(params)
    expect(action.exposures[:recipients]).to eq(recipients)
  end
end
