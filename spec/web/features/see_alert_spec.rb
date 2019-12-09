require 'features_helper'

describe 'See alert' do
  let(:repository) { AlertRepository.new }
  let(:alert) { repository.last }
  let(:uuid) { '1' }
  let(:alert_title) { 'Tornado warning' }
  let(:location) { 'Topeka, Kansas' }
  let(:message) { 'Grab Toto and go!' }
  let(:publish_at) { Time.utc(2019, 12, 8, 16, 22, 32) }
  let(:effective_at) { Time.utc(2019, 12, 8, 18, 00, 00) }
  let(:expires_at) { Time.utc(2019, 12, 8, 20, 00, 00) }

  before do
    repository.clear

    repository.create(
      uuid: uuid,
      title: alert_title,
      location: location,
      message: message,
      publish_at: publish_at,
      effective_at: effective_at,
      expires_at: expires_at
    )
  end

  it 'displays each alert on the page' do
    visit "/alerts/#{alert.id}"

    expect(page).to have_content("Uuid: #{uuid}")
    expect(page).to have_content("Title: #{alert_title}")
    expect(page).to have_content("Location: #{location}")
    expect(page).to have_content("Message: #{message}")
    expect(page).to have_content("Publish at: 2019-12-08 08:22:32 PST")
    expect(page).to have_content("Effective at: 2019-12-08 10:00:00 PST")
    expect(page).to have_content("Expires at: 2019-12-08 12:00:00 PST")
  end
end
