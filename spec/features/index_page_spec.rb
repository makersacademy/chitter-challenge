require_relative 'web_helper'

feature 'View Homepage' do
  scenario 'User visits Hompage and sees Chitter, Email and Login' do
    visit '/'
    expect(page).to have_content("Chitter")
    expect(page).to have_content("Email")
    expect(page).to have_field("Email") 
    expect(page).to have_content("Password")
    expect(page).to have_field("Password") 
    expect(page).to have_button("Log in")
  end
end

feature 'Login' do
  scenario 'User visits homepage, completes details, and logs in' do
    logintopage
    expect(page).to have_content("Username")
    expect(page).to have_button("Add Peep")
  end
end

# feature 'Login' do
#   scenario 'User visits homepage, completes details, and logs in with incorrect details' do
#     visit '/'
#     fill_in'Email', with: "test@test.com"
#     fill_in'Password', with: "INCORRECT PASSWORD"
#     click_button("Log in")
#     expect(page).to have_content("Sorry")
#   end
# end

