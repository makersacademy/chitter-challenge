# As a user
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

describe 'Posting a Peep' do
  let(:user) do
    User.create(name: 'Joe Bloggs',
                username: 'joeb',
                email: 'joe.bloggs@gmail.com',
                password: 'jo3ble0bl3',
                password_confirmation: 'jo3ble0bl3')
  end

  scenario 'redirects to /peeps and adds the peep to the db table' do
    sign_in(username: user.username, password: user.password)
    peep('Test Peep')
    expect(Peep.first.user).to eq user
    expect(Peep.first.content).to eq 'Test Peep'
  end

  scenario 'button not available if user not logged in' do
    visit '/'
    expect(page).to_not have_selector("input[type=submit][value='Post a Peep']")
  end

  scenario 'flashes error if attempt to post peep when not logged in' do
    peep('Test Peep')
    expect(page).to have_content 'User must not be blank'
  end

  scenario 'flashes error if content over 140 characters' do
    peep('peep' * 140)
    expect(page).to have_content(
      'Content must be between 1 and 140 characters long'
    )
  end
end

