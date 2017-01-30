feature '1 Sign Up' do
  scenario 'User can sign up' do
    signup
    expect(page).to have_content 'Welcome to Chitter Lauren!'
  end
  scenario 'User can click through to login if already signed up' do
    visit '/'
    click_button('Login')
    expect(current_path).to eq '/login'
  end
end
