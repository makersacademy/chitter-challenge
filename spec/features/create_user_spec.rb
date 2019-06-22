# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter


feature 'create a user account' do
  scenario 'Sign up as a user' do

    visit '/'
    click_button('New User')
    fill_in('name' with: 'Jack')
    fill_in('username' with: 'JD')
    fill_in('email' with: 'jd@peep.com')
    fill_in('password' with: 'sshhhhh')
    click_button('Add Me')
    expect(page).to have_content('Hi JD')  
  end
end