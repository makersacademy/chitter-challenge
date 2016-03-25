feature 'Add user account' do
  scenario 'user signup' do

    sign_up

    expect(User.all.count).to eq 1
    expect(page).to have_content('Welcome, test@example.com')
    user = User.last
    expect(user.email).to eq SessionHelpers::EMAIL
    expect(user.password_hash).not_to eq SessionHelpers::PASSWORD
  end
end
