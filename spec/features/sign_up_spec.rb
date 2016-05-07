feature 'User sign up' do
  scenario 'A user can access sign up from home page' do
    visit '/'
    click_button 'Sign up'
    expect(page).to have_content 'Sign up to Chitter'
  end

  scenario 'A user can sign up, user count increases by one' do
    expect{ new_user }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Alex!')
    expect(User.first.name).to eq 'Alex'
  end

  scenario 'Requires a matching confirmation' do
    expect { new_user(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq ('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

end
