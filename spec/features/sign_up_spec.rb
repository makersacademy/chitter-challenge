feature 'user sign up' do
  scenario 'a user may sign up to Chitter' do
    expect{ sign_up }.to change(User, :count).by (1)
    expect(page).to have_content "Edward's Chitter!"
    expect(User.first.email).to eq ('edwardkerry@gmail.com')
  end

  scenario 'a name is required' do
    expect{ sign_up(name: nil) }.not_to change(User, :count)
  end

  scenario 'a username is required' do
    expect{ sign_up(user_name: nil) }.not_to change(User, :count)
  end

  scenario 'an email is required' do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'email must be correct format' do
    expect{ sign_up(email: 'edwardkerry.gmail') }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'password confirmation must match' do
      expect{ sign_up(password_confirmation: 'badpassword') }.not_to change(User, :count)
      expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'duplicate emails may not be registered' do
    sign_up
    click_button 'Sign Out'
    expect{ sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'duplicate usernames may not be registered' do
    sign_up
    click_button 'Sign Out'
    expect{ sign_up }.not_to change(User, :count)
    expect(page).to have_content 'User name is already taken'
  end

end
