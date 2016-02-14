feature 'sign_in' do
  scenario 'user can sign-in' do
    sign_up
    visit('sessions/new')
    fill_in 'email', with: 'example@example.com'
    fill_in 'password', with: 'pa$$word'
    click_button 'Log in'
    expect(current_path).to eq('/peeps')
  end
end
