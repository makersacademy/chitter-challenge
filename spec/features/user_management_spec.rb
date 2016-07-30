# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up for chitter' do
  scenario 'I can create a new user account' do
    visit '/users/sign_up'

    expect(page.status_code).to eq 200

    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, acsauk')
    expect(User.first.email).to eq('abc@xyz.com')
  end

  scenario "I cannot sign up when using passwords that don't match" do
    visit '/users/sign_up'

    expect(page.status_code).to eq 200

    expect{ sign_up(password_confirmation: "1234") }.not_to change(User, :count)
    expect(current_path).to eq '/users/sign_up'
    expect(page).to have_content 'Passwords provided do not match. Please provide matching passwords and click sign up again'
  end

  scenario "If I make a mistake in the form I would like my email to persist" do
    visit '/users/sign_up'

    expect(page.status_code).to eq 200

    sign_up(password_confirmation: nil)
    expect(page).to have_field('email', with:'abc@xyz.com')

  end
end
