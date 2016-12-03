require './app/app'

RSpec.feature "Signing up", :type => :feature do
  scenario "user creates an account" do
    DatabaseCleaner.clean
    user_count = User.all.count
    signup
    fill_in('password_confirmation', with: 'gweatonidas36')
    click_button('Submit')
    expect(current_path).to eq '/dashboard'
    message = "Welcome to Chitter, Miko!"
    expect(page).to have_content(message)
    expect(User.all.count).to eq (user_count + 1)
  end
end
