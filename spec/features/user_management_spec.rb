feature 'A user can sign up' do
  scenario 'Signing up with valid credentials' do
    visit '/users/new'
    fill_in(:username, with: 'amanzano')
    fill_in(:password, with: 'security')
    fill_in(:password_confirmation, with: 'security')
    fill_in(:email, with: 'arnold@myemail.com')
    fill_in(:name, with: 'Arnold Manzano')
    click_button('Sign up')
    expect(current_path).to eq('/')
    expect(User.count).to eq(1)
  end
end
