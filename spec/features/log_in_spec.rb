feature 'User log in' do
  scenario 'user successfully logs in' do
    visit '/users/new'
    fill_in(:email, with: 'echai93@gmail.com')
    fill_in(:password, with: 'brocolli')
    fill_in(:password_confirmation, with :'brocolli')
    click_button 'Sign up'
    visit '/sessions/new'
    fill_in(:email, with: 'echai93@gmail.com')
    fill_in(:password, with: 'brocolli')
    click_button 'Log in'
    expect(current_path).to eq '/peeps'
  end
end
