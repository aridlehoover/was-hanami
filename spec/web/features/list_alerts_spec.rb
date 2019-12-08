require 'features_helper'

describe 'List alerts' do
  let(:repository) { AlertRepository.new }

  before do
    repository.clear

    repository.create(
      uuid: '1',
      title: 'Tornado warning',
      location: 'Topeka, Kansas',
      message: 'Grab Toto and go!',
      publish_at: Time.now,
      effective_at: Time.now + (6 * 3600),
      expires_at: Time.now + (12 * 3600)
    )
    repository.create(
      uuid: '2',
      title: 'Volcano warning',
      location: 'Yellowstone National Park, Wyoming',
      message: 'Grab Yogi and Booboo and go!',
      publish_at: Time.now,
      effective_at: Time.now + (6 * 3600),
      expires_at: Time.now + (12 * 3600)
    )
  end

  it 'displays each alert on the page' do
    visit '/alerts'

    within '#alerts' do
      expect(page).to have_css('.alert', count: 2)
    end
  end
end
