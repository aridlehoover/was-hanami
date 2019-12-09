describe Web::Views::Alerts::Show, type: :view do
  let(:exposures) { Hash[alert: alert] }
  let(:alert) do
    Alert.new(
      title: alert_title,
      publish_at: publish_at,
      effective_at: effective_at,
      expires_at: expires_at
    )
  end
  let(:alert_title) { 'Tornado warning' }
  let(:publish_at) { Time.utc(2019, 12, 8, 16, 22, 32) }
  let(:effective_at) { Time.utc(2019, 12, 8, 18, 00, 00) }
  let(:expires_at) { Time.utc(2019, 12, 8, 20, 00, 00) }
  let(:template) { Hanami::View::Template.new('apps/web/templates/alerts/show.html.erb') }
  let(:view) { described_class.new(template, exposures) }
  let(:rendered) { view.render }

  it 'exposes #alert' do
    expect(view.alert).to eq exposures.fetch(:alert)
  end

  describe '#publish_at' do
    context 'when publish_at is NOT nil' do
      it 'returns the local time' do
        expect(view.publish_at).to eq('2019-12-08 08:22:32 PST')
      end
    end

    context 'when publish_at is nil' do
      let(:publish_at) { nil }

      it 'returns nil' do
        expect(view.publish_at).to be_nil
      end
    end
  end

  describe '#effective_at' do
    context 'when effective_at is NOT nil' do
      it 'returns the local time' do
        expect(view.effective_at).to eq('2019-12-08 10:00:00 PST')
      end
    end

    context 'when effective_at is nil' do
      let(:effective_at) { nil }

      it 'returns nil' do
        expect(view.effective_at).to be_nil
      end
    end
  end

  describe '#expires_at' do
    context 'when expires_at is NOT nil' do
      it 'returns the local time' do
        expect(view.expires_at).to eq('2019-12-08 12:00:00 PST')
      end
    end

    context 'when expires_at is nil' do
      let(:expires_at) { nil }

      it 'returns nil' do
        expect(view.expires_at).to be_nil
      end
    end
  end
end
