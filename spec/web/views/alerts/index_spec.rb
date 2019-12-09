RSpec.describe Web::Views::Alerts::Index, type: :view do
  let(:exposures) { Hash[alerts: alerts] }
  let(:alerts) { [] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/alerts/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #alerts' do
    expect(view.alerts).to eq exposures.fetch(:alerts)
  end

  context 'when there are alerts' do
    let(:alert1) { Alert.new(id: 1, title: 'Tornado warning') }
    let(:alert2) { Alert.new(id: 2, title: 'Volcano warning') }
    let(:alerts) { [alert1, alert2] }

    it 'lists them all' do
      expect(rendered.scan(/class="alert"/).length).to eq(2)
      expect(rendered).to include('Tornado warning')
      expect(rendered).to include('Volcano warning')
    end

    it 'hides the placeholder text' do
      expect(rendered).not_to include('There are no alerts yet')
    end
  end

  context 'when there are NO alerts' do
    it 'shows the placeholder text' do
      expect(rendered).to include('There are no alerts yet')
    end
  end
end
