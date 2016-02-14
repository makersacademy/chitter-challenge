feature 'Logging into Chitter' do

  before(:each) do
    User.create(email: 'alice@example.com',
                password: 'aliali',
                username: 'useruser',
                name: 'alice')
  end

  scenario 'I can sign in as a existing user' do
    expect { sign_in('alice@example.com') }.to_not change(User, :count)
    expect(page).to have_content('Welcome back in chitter')
    expect(current_path).to eq('/sessions/welcome')
  end

  scenario 'I cannot sign in with a non existing email' do
    sign_up
    expect { sign_in('anotheremail@example.com') }.to_not change(User, :count)
    expect(current_path).to eq('/sessions/failed')
    expect(page.status_code).to eq(200)
  end

end


def sign_in (email)
  visit '/sessions/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: email
  fill_in :password, with: 'aliali'
  click_button 'Sign in'
end