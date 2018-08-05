feature 'User account creation' do
  before(:each) do
      visit('/') 
      add_users_to_db
  end
  scenario 'User can sign up for twatter' do
    fill_in('username', with: 'realuser')
    fill_in('password', with: 'qweasd123456')
    fill_in('email', with: 'thisemailisreal@gmail.com')
    fill_in('name', with: 'imarealboy')
    click_button('Create Account')
    expect(page).to have_content('account created')
  end
  context 'verification tests' do
    after(:each) { expect(page).to_not have_content('Account Created') }
    scenario 'User cannot sign up with bad email' do
      fill_in('username', with: 'fakeemail')
      fill_in('password', with: 'qweasd123456')
      fill_in('email', with: 'thisemailisfake')
      fill_in('name', with: 'imfakeasf')
      click_button('Create Account')
      expect(page).to have_content('invalid email')
    end
    scenario 'User cannot sign up with bad password' do
      fill_in('username', with: 'fakeemail')
      fill_in('password', with: 'baadpassword')
      fill_in('email', with: 'passwordisbad@gmail.com')
      fill_in('name', with: 'wrongpass')
      click_button('Create Account')
      expect(page).to have_content('invalid password')
    end
    scenario 'User cannot sign up with non uniq username' do
      fill_in('username', with: 'JackIsCool')
      fill_in('password', with: 'qweasd123456')
      fill_in('email', with: 'thisemailisreal@gmail.com')
      fill_in('name', with: 'toobadd')
      click_button('Create Account')
      expect(page).to have_content('username taken')
    end
  end
end
