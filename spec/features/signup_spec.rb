feature 'Signing up' do
  scenario 'User can sign up to chitter' do
    visit('/users/new')
    fill_in('email', with: 'dione@gmail.com')
    fill_in('password', with: 'password5678')
    fill_in('name', with: 'Dione')
    fill_in('username', with: 'dione-dls')
    click_button('Submit')
    expect(page).to have_content 'Welcome, Dione'
  end
end
