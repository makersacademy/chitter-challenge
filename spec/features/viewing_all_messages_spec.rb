require './app/app'

RSpec.feature "Viewing all messages", :type => :feature do
  scenario "user wamts to see all messages" do
    DatabaseCleaner.clean
    signup
    fill_in('password_confirmation', with: 'gweatonidas36')
    click_button('Submit')
    sign_in
    post_message
    signup_two
    sign_in_two
    post_message_two
    click_button("See all chirps!")
    expect(current_path).to eq '/messages/all'
    message = "Hello world!"
    message_two = "I love drag race!"
    expect(page).to have_content(message)
    expect(page).to have_content(message_two)
  end
end
