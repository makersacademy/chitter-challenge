feature 'logging in' do
  before do
    User.create(name: 'Test Name', username: 'TestUser1', email: 'a@b.com', password: 'Pw123')
  end

  scenario 'greeted by username on successful login' do
    visit '/peeps'
    click_button 'Sign In'
    fill_in('username', with: 'TestUser1')
    fill_in('password', with: 'Pw123')
    click_button 'Get Peeping'

    expect(page).to have_content 'Hello TestUser1!'
    expect(current_path).to  eq '/peeps'
    expect(page).not_to have_content 'Incorrect login details'
  end

  scenario 'user receives flash message with wrong username' do
    visit '/peeps'
    click_button 'Sign In'
    fill_in('username', with: 'wrongUsername')
    fill_in('password', with: 'Pw123')
    click_button 'Get Peeping'

    expect(page).to have_content 'Incorrect login details'
    expect(current_path).to eq '/sessions/new'
    expect(page).not_to have_content 'Hello'
  end

  scenario 'user receives flash message with wrong password' do
    visit '/peeps'
    click_button 'Sign In'
    fill_in('username', with: 'TestUser1')
    fill_in('password', with: 'WrongPassword')
    click_button 'Get Peeping'

    expect(page).to have_content 'Incorrect login details'
    expect(current_path).to eq '/sessions/new'
    expect(page).not_to have_content 'Hello'
  end

  scenario 'can peep after signing successful login' do
    visit '/peeps'
    click_button 'Sign In'
    fill_in('username', with: 'TestUser1')
    fill_in('password', with: 'Pw123')
    click_button 'Get Peeping'

    click_button 'Peep'
    fill_in('peep', with: 'Building Chitter')
    click_button 'Post'

    expect(current_path).to  eq '/peeps'
    expect(first('.peep')).to have_content 'Building Chitter'
    expect(first('.peep')).to have_content 'TestUser1'
    expect(page).not_to have_button 'Sign In'
  end
end
