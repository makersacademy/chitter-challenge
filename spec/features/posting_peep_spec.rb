feature 'Being able to post a message' do

  before(:each) do
    User.create(email: 'alice@example.com',
                password: 'aliali',
                username: 'useruser',
                name: 'alice')
  end

  scenario 'when I am logged in I can peep' do
    sign_in('alice@example.com')
    expect { peep_up }.to change(Peep, :count).by(1)
    expect(current_path).to eq('/')
    expect(page).to have_content('Hi, I am Bing')
  end

end

def peep_up
  fill_in :peep, with: 'Hi, I am Bing'
  click_button 'Peep me'
end

def sign_in (email)
  visit '/sessions/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: email
  fill_in :password, with: 'aliali'
  click_button 'Sign in'
end