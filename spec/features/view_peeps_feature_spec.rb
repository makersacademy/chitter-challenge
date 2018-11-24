feature 'posting and viewing peeps' do
  scenario 'a user can sign up to chitter and post a peep' do
    visit '/'
    click_button 'Sign Up'
    expect(current_path).to eq '/users/new'
    fill_in('name', with: 'Test Name')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('username', with: 'my_username')
    click_button('Submit')

    click_button 'Add Peep'

    expect(current_path).to eq "/peeps/new"

    fill_in 'message', with: 'This is a test peep'

    click_button 'Submit'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'This is a test peep'
    expect(page).to have_content 'my_username'
  end
end
