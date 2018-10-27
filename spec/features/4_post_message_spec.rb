require "message"

feature 'Feature: Message posting' do
  scenario 'Only logged in members can post messages' do
    sign_in
    expect(current_path).to eq '/message'
    expect(page).to have_button('submit', disabled: false)
    fill_in :message, with: 'Elvis has left the building'
    click_button('submit')
    expect(current_path).to eq '/message'
    expect(page).to have_content 'Elvis has left the building'
  end

end
