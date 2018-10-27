require "message"

feature 'Feature: Message update' do
  scenario 'Logged in members can update messages' do
    message = sign_in_create_message
    expect(page).to have_button('update')
    click_button('update')
    expect(current_path).to eq "/message/#{message}/update"
    expect(page).to have_button('update')
    fill_in :updatetext, with: 'Apalling Sherlock!'
    click_button('update')
    expect(current_path).to eq "/message"
    expect(page).to have_content 'Apalling Sherlock'
  end

  scenario 'Non logged-in members cannot update messages' do
    user = User.create(name: "Elvis", email: 'test@example.com', password: 'password', receive_email: 'y')
    Message.create(sender: user.id,text: "Hello Tom")
    visit '/message'
    expect(page).to have_no_button('update')
  end

end
