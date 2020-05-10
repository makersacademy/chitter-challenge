feature 'Signing up to Chitter' do
  scenario 'a user can register with an account' do
    visit '/'

    expect(page).to have_link('Create an account', href: '/users/new')
    click_link 'Create an account'

    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Chitter registration form'

    fill_in 'name', with: 'Marius'
    fill_in 'username', with: 'mbrad26'
    fill_in 'email', with: 'marius2020@gmail.com'
    fill_in 'password', with: 'apassword'
    click_button 'Create account'

    expect(current_path).to eq '/'
  end
end
