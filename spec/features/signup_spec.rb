feature 'Sign up' do
  scenario 'A user can register to chitter' do
    visit('/signup')
    expect(page).to have_content('Create your account')

    fill_in('name', with: 'Sandy')
    fill_in('last_name', with: 'Pounoussamy')
    fill_in('username', with: 'sandy974')
    fill_in('email', with: 'pounoussamy.sandy@gmail.com')
    fill_in('password', with: '1234')
    click_button('Submit')

    expect(current_path).to eq '/feed'
  end
end
