feature 'Posting a peep' do
  let!(:user) do
    User.create(email: 'joe@email.com',
                password: '1234',
                password_confirmation: '1234')
  end
  scenario 'As a user I want to post a peep to Chitter' do
    sign_in(email: user.email,   password: user.password)
    visit 'peeps/new'
    fill_in :message, with: 'Hello world!'
    click_button 'Peep'
    expect(current_path).to eq '/'
    expect(page).to have_content 'Hello world!'
  end
  scenario 'User can see the time of a peep' do
    sign_in(email: user.email,   password: user.password)
    visit 'peeps/new'
    fill_in :message, with: 'Hello world!'
    click_button 'Peep'
    expect(current_path).to eq '/'
    expect(page).to have_content 'Hello world!'
    expect(page).to have_content Time.now
  end
end
