require 'features_helper'

describe 'Add an alert' do
  after do
    AlertRepository.new.clear
  end

  it 'can create a new alert' do
    visit '/alerts/new'

    within 'form#alert-form' do
      fill_in 'Uuid', with: '123'
      fill_in 'Title', with: 'Tornado warning'
      fill_in 'Location', with: 'Topeka, Kansas'
      fill_in 'Message', with: 'Grab Toto and go!'
      fill_in 'Publish at', with: Time.now
      fill_in 'Effective at', with: Time.now + (6 * 3600)
      fill_in 'Expires at', with: Time.now + (12 * 3600)

      click_button 'Create'
    end

    expect(page).to have_current_path('/alerts')
    expect(page).to have_content('Tornado warning')
  end
end
