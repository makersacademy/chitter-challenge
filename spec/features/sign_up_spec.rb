feature 'Sign up' do
  scenario 'when submitting the sign up form' do
    visit '/'
    sign_up
    expect(page.status_code).to eq 200
    expect(page).to have_content('Welcome kyaw')
  end

  scenario 'it creates the user account' do
    visit '/'
    sign_up
    expect(User.first.email).to eq('kyaw@gmail.com')
    expect(User.all.size).to eq 1
  end

  scenario 'requires a matching confirmation password' do
    visit '/'
    click_button 'Sign up'
    fill_in :user_name, with: 'kyaw'
    fill_in :email, with: 'kyaw@gmail.com'
    fill_in :password, with: '1234'
    fill_in :password_confirmation, with: '4321'
    click_button 'Submit'
    expect(User.all.size).to eq 0
  end

end
