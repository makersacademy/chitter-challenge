feature '#User sign up' do
  scenario 'Can sign up on chitter' do
    visit('/users/new')
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
    expect(current_path).to eq('/users/new')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'requires user to input an email' do
    user = build(:user, email: '')
    sign_up_as(user)
    expect(current_path).to eq('/users/new')
  end

  scenario 'cannot sign up with an existing email' do
    user = create(:user)
    sign_up_as(user)
    expect(page).to have_content('Email is already taken')
  end
end

feature '#User login' do
  scenario 'Can log into Chitter' do
    user = create(:user)
    sign_in_as(user)
    expect(current_path).to eq('/')
    expect(page).to have_content("Welcome, #{user.name}")
  end
end

feature '#User signs out' do
  scenario 'signs out while logged in' do
    user = create(:user)
    sign_in_as(user)
    click_button('Sign out')
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content("Welcome, #{user.name}")
  end
end
