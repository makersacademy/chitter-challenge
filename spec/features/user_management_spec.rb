feature do
  scenario 'User can sign up' do
    visit('/')
    click_button('Sign up')
    expect(curret_path).to eq('/users/new')
    fill_in('email', with: 'test@test.com')
    fill_in('password', wth: 'test')
    fill_in('password_confirmation', with: 'test')
    fill_in('name', with: 'Testbot')
    fill_in('user name', with: 'Tester')
    click_button('Register')
    expect(curret_path).to eq('/')
  end
end
