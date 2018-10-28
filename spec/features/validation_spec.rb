feature 'Feature - Registration validation' do

  it 'Email address must be a valid email address' do
    visit '/users/new'
    fill_in('first_name', with: 'Test')
    fill_in('last_name', with: 'McTest')
    fill_in('username', with: 'Testannosaurus')
    fill_in('email', with: 'test')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).not_to have_content "Welcome, Testannosaurus"
    expect(page).to have_content "Please use a valid email address"
  end
end
