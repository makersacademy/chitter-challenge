feature 'Sign up:' do
  scenario 'New enters details and is signed up' do
    visit '/peeps'
    fill_in 'name', with: 'Joe Bloggs'
    fill_in 'username', with: 'newmaker'
    fill_in 'email', with: 'jb@jbmail.com'
    fill_in 'password', with: 'averyweirdpassword'
    click_button 'Sign up'
    expect(page).to have_content("Welcome newmaker")
  end
end
