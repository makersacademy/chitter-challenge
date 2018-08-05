feature 'User account creation' do
  scenario 'User can sign up for twatter' do
    visit('/')
    fill_in('username', with: 'Durain')
    fill_in('password', with: '123456')
    click_button('Create Account')
    expect(page).to have_content('Account Created')
  end
  context 'verification tests' do
    scenario 'User cannot sign up with bad email' do

    end
    scenario 'User cannot sign up with bad password' do

    end
    scenario 'User cannot sign up with non uniq username' do

    end
  end
end
