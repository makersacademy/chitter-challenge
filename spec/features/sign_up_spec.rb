feature 'Sign up' do
  scenario 'when submitting the sign up form' do
    visit '/'
    click_button 'Sign up'
    fill_in :user_name, with: 'kyaw'
    fill_in :email, with: 'kyaw@gmail.com'
    fill_in :password, with: '1234'
    fill_in :confirmation, with: '1234'
    click_button 'Submit'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Welcome kyaw')
  end

  scenario 'it creates the user account' do
    visit '/'
    click_button 'Sign up'
    fill_in :user_name, with: 'kyaw'
    fill_in :email, with: 'kyaw@gmail.com'
    fill_in :password, with: '1234'
    fill_in :confirmation, with: '1234'
    click_button 'Submit'
    expect(User.first.email).to eq('kyaw@gmail.com')
  end
end
