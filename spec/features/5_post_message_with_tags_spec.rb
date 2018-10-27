require "message"

feature 'Feature: Message tagging' do
  scenario 'If tagged in message, members should receive email' do
    sign_in
    expect(current_path).to eq '/message'
    expect(page).to have_button('submit', disabled: false)
    fill_in :message, with: 'Elvis has left the building @Elvis'
    click_button('submit')
    expect(current_path).to eq '/message'
    expect(page).to have_content 'Email sent'
  end

end
