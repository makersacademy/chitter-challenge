require './app/app'

RSpec.feature "New message", :type => :feature do
  scenario "user submits a new message" do
    DatabaseCleaner.clean
    signup
    fill_in('password_confirmation', with: 'gweatonidas36')
    click_button('Submit')
    sign_in
    visit '/messages/new'
    fill_in('new_message', with: "Hello world!")
    click_button('Chirp!')
    expect(current_path).to eq '/dashboard'
    message = "Your message has been posted. Click here to see it now."
    expect(page).to have_content(message)
    expect(Message.first.content). to eq "Hello world!"
  end
end
