require 'features_helper'

describe 'List recipients' do
  let(:repository) { RecipientRepository.new }

  before do
    repository.clear

    repository.create(
      channel: 'email',
      address: 'dorothy@oz.com',
    )
    repository.create(
      channel: 'email',
      address: 'wicked_witch@oz.com',
    )
  end

  it 'displays each recipient on the page' do
    visit '/recipients'

    within '#recipients' do
      expect(page).to have_css('.recipient', count: 2)
    end
  end
end
