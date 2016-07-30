# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up for chitter' do
  scenario 'I can create a new user account' do
    visit '/users/sign_up'

    expect(page.status_code).to eq 200

    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, acsauk')
    expect(User.first.email).to eq('a@b.com')
  end

  scenario "I cannot sign up when using passwords that don't match" do
    visit '/users/sign_up'

    expect(page.status_code).to eq 200

    expect{ sign_up(password_confirmation: nil) }.not_to change(User, :count)
  end
end
