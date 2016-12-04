require './app/app'

RSpec.feature "New message", :type => :feature do
  scenario "user submits a new message" do
    DatabaseCleaner.clean
    signup
    fill_in('password_confirmation', with: 'gweatonidas36')
    click_button('Submit')
    sign_in
    post_message
    click_button("See your chirps!")
    expect(current_path).to eq '/messages/Miko'
    message = "Hello world!"
    expect(page).to have_content(message)
  end
end
