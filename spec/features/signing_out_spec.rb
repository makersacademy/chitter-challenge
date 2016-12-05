require './app/app'

RSpec.feature "Signing out", :type => :feature do
  scenario "user signs out" do
    signup
    fill_in('password_confirmation', with: 'gweatonidas36')
    click_button('Submit')
    sign_in
    click_button('Log out')
    expect(current_path).to eq '/'
    message = "Good bye! We hope to see you again soon :)"
    expect(page).to have_content(message)
    welcome = "Welcome back, Miko!"
    expect(page).not_to have_content(welcome)
  end
end
