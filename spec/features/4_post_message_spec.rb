require "message"

feature 'Feature: Message posting' do
  scenario 'Only logged in members can post messages' do
    user = User.create(name: "Elvis", email: 'test@example.com', password: 'password', receive_email: 'y')
    visit '/user'
    fill_in :name, with: 'Elvis'
    fill_in :password, with: 'password'
    click_button('submit')
    expect(page).to have_button('submit', disabled: false)
    fill_in :message, with: 'Elvis has left the building'
    click_button('submit')
    expect(page).to have_content 'Elvis has left the building'
  end

end
