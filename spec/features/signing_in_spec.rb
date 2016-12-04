require './app/app'

RSpec.feature "Signing in", :type => :feature do
  scenario "user signs in" do
    DatabaseCleaner.clean
    signup
    fill_in('password_confirmation', with: 'gweatonidas36')
    click_button('Submit')
    visit '/sessions/new'
    fill_in('username', with: 'Miko')
    fill_in('password', with: 'gweatonidas36')
    click_button('Submit')
    expect(current_path).to eq '/dashboard'
    message = "Welcome back, Miko!"
    expect(page).to have_content(message)
    # expect(@current_user.username).to eq "Miko"
  end
end
