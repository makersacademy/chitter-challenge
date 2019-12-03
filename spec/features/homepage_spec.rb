# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Visit homapage' do
  scenario "User can sign up from homepage" do
    visit '/'
    expect(page).to have_content "Sign up"
  end
end
