require 'user'

feature 'authentication' do
  let(:user) { User.create(email: 'test@example.com',
    password: 'password123',
    name: 'testdude',
    handle: 'testhandle'
    ) }

  it 'a user can sign in' do
    visit '/peeps'
    click_on "Sign in"
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_on 'Sign in'
    expect(page).to have_content 'Logged in as testhandle'
  end
end
