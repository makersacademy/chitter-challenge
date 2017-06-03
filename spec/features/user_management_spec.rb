# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    visit '/peeps'
    click_button('Register')

    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello, john999')
    expect(User.first.email).to eq('myname@example.com')
  end

  def sign_up(name: 'John Smith',
              username: 'john999',
              email: 'myname@example.com',
              password: 'oranges!')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in(:name,    with: name)
    fill_in(:username,    with: username)
    fill_in(:email,    with: email)
    fill_in(:password, with: password)
    click_button('Sign up')
  end

end
