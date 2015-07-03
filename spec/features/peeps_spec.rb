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

  scenario 'peeps appear in reverse chronological order' do
    user = User.create(user_params)
    visit '/'
    within 'form#sign_in' do
      fill_in 'username', with: user.username
      fill_in 'password', with: user.password
    end
    click_button 'Sign in'
    fill_in 'peep', with: 'Hello world!'
    click_button 'Peep'
    Peep.create(text: 'It is me', time_stamp: Time.now + 1, user_id: user.id)
    click_button 'Peep'
    expect(first 'li').to have_content 'It is me'
  end

  scenario 'peeps time stamp is attached' do
    user = User.create(user_params)
    visit '/'
    within 'form#sign_in' do
      fill_in 'username', with: user.username
      fill_in 'password', with: user.password
    end
    click_button 'Sign in'
    fill_in 'peep', with: 'Hello world!'
    click_button 'Peep'
    expect(page).to have_content Peep.first(user_id: user.id).time_stamp
  end

  scenario 'peeps username is attached' do
    user = User.create(user_params)
    visit '/'
    within 'form#sign_in' do
      fill_in 'username', with: user.username
      fill_in 'password', with: user.password
    end
    click_button 'Sign in'
    fill_in 'peep', with: 'Hello world!'
    click_button 'Peep'
    expect(page).to have_content user.username
  end

  skip 'if user is not logged in they can still view peeps' do
    user = User.create(user_params)
    visit '/'
    within 'form#sign_in' do
      fill_in 'username', with: user.username
      fill_in 'password', with: user.password
    end
    click_button 'Sign in'
    fill_in 'peep', with: 'Hello world!'
    click_button 'Peep'
    click_button 'Sign out'
    visit '/test_name'
    expect(page).to have_content 'Hello world!'
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
