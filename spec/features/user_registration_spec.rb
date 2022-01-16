feature 'registration' do

  scenario 'user can sign up for Chitter' do
    visit '/users/new'
    fill_in('username', with: 'testusername')
    fill_in('handle', with: '@test')
    fill_in('password', with: 'passwordtest')
    click_button('Complete registration')
    
    expect(page).to have_content 'Welcome testusername'
  end
end