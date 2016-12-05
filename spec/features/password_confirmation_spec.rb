require './app/app'

RSpec.feature "Password confirmation", :type => :feature do
  scenario "user enters mismatching passwords" do
    user_count = User.all.count
    signup
    fill_in('password_confirmation', with: 'wrongpassword')
    click_button('Submit')
    expect(current_path).to eq '/users/new'
    message = "Password does not match the confirmation"
    expect(page).to have_content(message)
    expect(User.all.count).to eq user_count
  end
end
