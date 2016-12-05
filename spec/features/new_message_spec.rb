require './app/app'

RSpec.feature "New message", :type => :feature do
  scenario "user submits a new message" do
    signup
    fill_in('password_confirmation', with: 'gweatonidas36')
    click_button('Submit')
    sign_in
    post_message
    expect(current_path).to eq '/dashboard'
    message = "Your message has been posted."
    expect(page).to have_content(message)
    expect(Message.first.content). to eq "Hello world!"
  end
end
