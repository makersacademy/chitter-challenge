# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Users can sign up' do
  include Helpers
  scenario 'users can sign up with their full details' do
    visit '/'
    sign_up
    expect(page).to have_content "Logged in as: tansaku"
  end
end
