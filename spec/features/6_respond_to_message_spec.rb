require "message"

feature 'Feature: Message replying' do
  scenario 'Logged in members can reply to messages' do

    message= sign_in_create_message
    expect(page).to have_button('reply')
    click_button('reply')
    expect(current_path).to eq "/message/#{message}/reply"
    expect(page).to have_button('reply')
    fill_in :replytext, with: 'Elementary Watson'
    click_button('reply')
    expect(current_path).to eq '/message'
    expect(page).to have_content 'Elementary Watson'
  end

  scenario 'Non logged-in members cannot reply to messages' do
    user = User.create(name: "Elvis", email: 'test@example.com', password: 'password', receive_email: 'y')
    Message.create(sender: user.id,text: "Excellent Sherlock!")
    visit '/message'
    expect(page).to have_no_button('reply')
  end

end
