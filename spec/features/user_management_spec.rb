feature 'User\'s' do

  def sign_up(username: 'Triffanys101',
              email: 'triffanys@example.com',
              password: 'princess',
              password_confirmation: 'princess')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :username, with: username
    fill_in :email,    with: email
    fill_in :password, with: password
    click_button 'Sign up'
  end

  scenario 'can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Triffanys101')
    expect(User.first.username).to eq('Triffanys101')
  end

  scenario 'requires a matching confirmation password when signing up' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end
end