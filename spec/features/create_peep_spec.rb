# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'post a peep' do
  scenario 'Sign up as a user a post a peep for the first time' do

     visit '/'
    click_button('New User')
    fill_in('name', with: 'Jack')
    fill_in('username', with: 'JD')
    fill_in('email', with: 'jd@peep.com')
    fill_in('password', with: 'sshhhhh')
    click_button('Add Me')
    expect(page).to have_content('Hi JD')

     click_button('Post Peep')
    fill_in('message', with: 'This is my first peep')
    click_button('Peep')
    expect(page).to have_content('This is my first peep')
  end
end
