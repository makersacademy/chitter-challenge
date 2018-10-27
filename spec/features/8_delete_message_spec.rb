require "message"

feature 'Feature: Message delete' do
  scenario 'Logged in members can delete messages' do
    sign_in_create_message
    expect(page).to have_content 'Excellent Sherlock!'
    click_button('delete')
    expect(current_path).to eq "/message"
    expect(page).to have_no_content'Excellent Sherlock!'
  end

  scenario 'Non logged-in members cannot delete messages' do
    user = User.create(name: "Elvis", email: 'test@example.com', password: 'password', receive_email: 'y')
    message1 = Message.create(sender: user.id,text: "Excellent Sherlock!")
    visit '/message'
    expect(page).to have_no_button('delete')
  end

end
