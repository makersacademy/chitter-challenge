feature 'logging in' do
  scenario 'greeted by username on successful login' do
    User.create(name: 'Test Name', username: 'TestUser1', email: 'a@b.com', password: 'Pw123')

    visit '/peeps'
    click_button 'Sign In'
    fill_in('username', with: 'TestUser1')
    fill_in('password', with: 'Pw123')
    click_button 'Get Peeping'

    expect(page).to have_content 'Hello TestUser1!'
    expect(current_path).to  eq '/peeps'
    expect(page).not_to have_content 'Incorrect login details'
  end

  xscenario 'user receives flash message on unsucessful login' do
    User.create(name: 'Test Name', username: 'TestUser1', email: 'a@b.com', password: 'Pw123')

    visit '/peeps'
    click_button 'Sign In'
    fill_in('username', with: 'wrongUsername')
    fill_in('password', with: 'wrongPassword')
    click_button 'Get Peeping'

    expect(page).to have_content 'Incorrect login details'
    expect(current_path).to eq '/sessions/new'
    expect(page).not_to have_content 'Hello'
  end
end
