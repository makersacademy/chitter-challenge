# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Users can sign up' do
  scenario 'users can sign up with their full details' do
    visit '/homepage'
    # expect{sign_up}.to change(User, :count).by(1)
    sign_up
    expect(page).to have_content "Logged in as: tansaku"
  end
end
