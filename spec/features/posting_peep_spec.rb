feature 'posting a peep' do

  scenario 'logged in user submits a peep' do
    User.create(name: 'user', email: 'user@email.com', password: 'password',
     password_confirmation: 'password')
    log_in(email:'user@email.com',password:'password')
    visit '/peeps/new'
    fill_in('peep', with: 'My first peep!')
    click_button'Post your peep!'
    expect(page).to have_content('Congratulations! Your peep has been posted.')
  end

  scenario 'user is not logged in, so is redirected to log in' do
    visit '/peeps/new'
    expect(page).to have_content('Please log in to post a peep')
  end

  scenario 'user does not input a value into peep' do
    User.create(name: 'user', email: 'user@email.com', password: 'password',
     password_confirmation: 'password')
    log_in(email:'user@email.com',password:'password')
    visit '/peeps/new'
    expect{click_button'Post your peep!'}.not_to change(Peep, :count)
  end
end
