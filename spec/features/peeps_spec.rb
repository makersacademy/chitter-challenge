feature 'Peeps' do

  scenario 'user can post peeps' do
    user = User.create(user_params)
    visit '/'
    within 'form#sign_in' do
      fill_in 'username', with: user.username
      fill_in 'password', with: user.password
    end
    click_button 'Sign in'
    fill_in 'peep', with: 'Hello world!'
    click_button 'Peep'
    expect(page).to have_content 'Hello world!'
  end



  skip 'if user is not logged in they can still view peeps' do


  end

  scenario 'if user is not logged in she cannot peep' do
    visit '/users'
    expect(page).not_to have_selector 'form#peep'
  end

  def user_params
    { email: 'example@example.com',
      password: 'secret123',
      name: 'test',
      username: 'test_name' }
  end

end
