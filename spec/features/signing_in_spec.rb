require './app/app'

RSpec.feature "Signing in", :type => :feature do
  scenario "user signs in" do
    signup
    fill_in('password_confirmation', with: 'gweatonidas36')
    click_button('Submit')
    sign_in
    expect(current_path).to eq '/dashboard'
    message = "Welcome back, Miko!"
    expect(page).to have_content(message)
  end
end
