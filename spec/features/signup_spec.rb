feature 'Signing up' do
  scenario 'User can sign up to chitter' do
    visit('/sign_up')
    fill_in('Email', with: 'dione@gmail.com')
    fill_in('password', with: 'password5678')
    fill_in('name', with: 'Dione')
    fill_in('username', with: 'dione-dls')
    click_button('Submit')
  end
end
