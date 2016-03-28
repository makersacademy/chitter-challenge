feature 'users' do
  scenario 'sign up to increase user count' do
    expect{ sign_up }.to change{ User.count }.by 1
  end

  scenario 'welcome user on homepage when signed up' do
    sign_up
    expect(page).to have_content 'Welcome JohnDude'
    expect(current_path).to eq '/'
  end

  scenario 'don\'t allow multiple sign ups for same mail' do
    User.create(name: 'John',
                username: 'JohnDude',
                email: 'john@john.com',
                password: 'J0hn123!')
    expect{ sign_up }.not_to change{ User.count }
    expect(page).to have_content 'Username already exists!'
    expect(page).to have_content 'Email already exists!'
  end

  xscenario 'sign out' do

  end
end
