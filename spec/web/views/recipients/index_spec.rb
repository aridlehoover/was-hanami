describe Web::Views::Recipients::Index, type: :view do
  let(:exposures) { Hash[recipients: recipients] }
  let(:recipients) { [] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/recipients/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #recipients' do
    expect(view.recipients).to eq exposures.fetch(:recipients)
  end

  context 'when there are recipients' do
    let(:recipient1) { Recipient.new(address: 'dorothy@oz.com') }
    let(:recipient2) { Recipient.new(address: 'wicked_witch@oz.com') }
    let(:recipients) { [recipient1, recipient2] }

    it 'lists them all' do
      expect(rendered.scan(/class="recipient"/).length).to eq(2)
      expect(rendered).to include('dorothy@oz.com')
      expect(rendered).to include('wicked_witch@oz.com')
    end

    it 'hides the placeholder text' do
      expect(rendered).not_to include('There are no recipients yet')
    end
  end

  context 'when there are NO recipients' do
    it 'shows the placeholder text' do
      expect(rendered).to include('There are no recipients yet')
    end
  end
end
