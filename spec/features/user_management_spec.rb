feature '#User sign up' do
  scenario 'Can sign up on chitter' do
    visit('/users/sign_up')
    expect(page).to have_content('Email')
    expect(page).to have_content('Name')
    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
    expect(page).to have_content('Password Confirmation')
    user = build(:user)
    sign_up_as(user)
    expect(current_path).to eq('/')
    expect(page).to have_content("Welcome, #{user.name}")
  end

  scenario 'requires a matching confirmation password' do
    user = build(:user, password_confirmation: 'wrong')
    sign_up_as(user)
    expect(current_path).to eq('/users/sign_up')
    expect(page).to have_content('Password does not match the confirmation')
  end
end
