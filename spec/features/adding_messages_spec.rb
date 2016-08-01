require_relative '../web_helper.rb'

feature 'Adding messages' do

  scenario 'I can add a message to the homepage' do
    sign_up
    fill_in 'message', with: 'Whats up'
    click_button 'Submit'
    expect(current_path).to eq '/'
    expect(page.status_code).to eq 200
    within 'ul#messages' do
      expect(page).to have_content("Whats up")
    end
  end
end
