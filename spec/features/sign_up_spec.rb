# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature "User Signs Up" do
  scenario "User signs up with all vaild data" do
    sign_up_with_valid_details
    expect(page).to have_content 'Welcome, JohnDoe!'
  end
end
