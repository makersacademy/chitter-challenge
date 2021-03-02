feature 'Edit a peep' do
  scenario 'User can edit their own peep' do
    user = User.create(email: 'test@example.com', password: 'password123', name: 'Chrissy', username: 'chrisc')
    peep = Peep.create(content: 'Hello world!', user: user)

    visit '/peeps'
    click_button 'Sign in'
    fill_in(:username, with: 'chrisc')
    fill_in(:password, with: 'password123')
    click_button 'Sign in'

    expect(current_path).to eq "/peeps"
    click_button 'Edit'

    expect(current_path).to eq "/peeps/#{peep.id}/edit"

    fill_in(:peep, with: 'Hello world again!')
    click_button 'Submit'

    expect(current_path).to eq "/peeps"
    expect(page).to have_content 'Hello world again!'
  end
end
