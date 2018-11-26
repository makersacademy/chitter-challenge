feature 'post new peep' do
  scenario 'user can post a new peep' do
    visit '/'
    click_button 'Sign up'
    fill_in('firstname', with: 'Test')
    fill_in('lastname', with: 'McTest')
    fill_in('username', with: 'mrtest')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign up')
    fill_in('body', with: 'test peep')
    click_button('Post new peep')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'test peep'
  end

  scenario 'user can see when peeps were posted' do
    Timecop.freeze(2018,11,25,10,0,0)
    visit '/'
    click_button 'Sign up'
    fill_in('firstname', with: 'Test')
    fill_in('lastname', with: 'McTest')
    fill_in('username', with: 'mrtest')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign up')
    fill_in('body', with: 'test peep')
    click_button('Post new peep')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'test peep'
    expect(page).to have_content '10:00:00, Sunday 25 November 2018'
  end
end
