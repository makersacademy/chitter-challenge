require 'user'

feature 'authentication' do
  let(:create_user) { User.create(email: 'test@example.com',
    password: 'password123',
    name: 'testdude',
    handle: 'testhandle'
    ) }

  it 'lets a user sign in' do
    create_user
    visit '/peeps'
    click_on "Sign in"
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_on 'Sign in'
    expect(page).to have_content 'Logged in as testhandle'
  end

  it 'gives an error for a wrong email' do
    create_user
    visit '/sessions/new'
    fill_in(:email, with: 'wrongemail@wrong.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    expect(page).not_to have_content 'Logged in as testhandle'
    expect(page).to have_content 'Please check your email or password.'
  end

  it 'gives an error for a wrong password' do
    create_user
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wordpass321')
    click_button('Sign in')
    expect(page).not_to have_content 'Logged in as testhandle'
    expect(page).to have_content 'Please check your email or password.'
  end

  it 'lets a user sign out' do
    create_user
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_on('Sign in')
    click_on('Sign out')
    expect(page).not_to have_content 'Logged in as'
    expect(page).not_to have_content 'Create a peep'
    expect(page).to have_content 'You have signed out.'
  end
end
