feature 'Add user account' do
  scenario 'user signup' do

    sign_up

    expect(User.all.count).to eq 1
    user = User.last
    expect(user.email).to eq SessionHelpers::EMAIL
    expect(user.name).to eq SessionHelpers::NAME
    expect(user.username).to eq SessionHelpers::USERNAME
    expect(user.password_hash).not_to eq SessionHelpers::PASSWORD
    expect(page).to have_content("Welcome, #{SessionHelpers::NAME}")

  end
end
