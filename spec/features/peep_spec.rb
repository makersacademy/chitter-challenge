require_relative '../login_helper'
require 'securerandom'

feature 'peep' do
  scenario 'should post and show a peep' do
    log_in
    test_string = SecureRandom.hex
    fill_in :text, with: "Test: #{test_string}"
    click_on('Peep!')
    expect(page).to have_content(test_string)
  end
end
