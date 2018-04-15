feature 'Should be able to post a peep to chitter' do

  scenario 'fill out post peep form and see peep on homepage' do
    add_user
    visit('/')
    click_link('Sign In')
    fill_in('username', with: 'Testy')
    fill_in('password', with: 'testing123')
    click_button('log_in')
    fill_in('peep', :with => 'my first peep!' )
    click_button 'Post'
    visit('/')
    expect(page).to have_content 'my first peep!'
  end

  scenario 'peeps appear in reverse chronological order' do
    visit('/')
    click_link('Sign In')
    fill_in('username', with: 'Testy')
    fill_in('password', with: 'testing123')
    click_button('log_in')
    fill_in('peep', :with => 'my first peep!' )
    click_button 'Post'
    fill_in('peep', :with => 'my second peep!' )
    click_button 'Post'
    visit('/')
    expect('my second peep!').to appear_before('my first peep!')
  end

  scenario 'peeps appear with time they were posted' do
    visit('/')
    click_link('Sign In')
    fill_in('username', with: 'Testy')
    fill_in('password', with: 'testing123')
    click_button('log_in')
    fill_in('peep', :with => 'my first peep!' )
    click_button 'Post'
    expect(page).to have_content (Time.now).strftime("%H:%M:%S")
  end

end
