# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter


feature 'create a user account' do
  scenario 'Sign up as a user' do

    visit '/'
    click_button('New User')
    fill_in('name', with: 'Elfi')
    fill_in('username', with: '@Elfi')
    fill_in('email', with: 'ef@peep.com')
    fill_in('password', with: '12345')
    click_button('Add Me')
    expect(page).to have_content('Hi @Elfi')  
  end
end
