feature 'authentication' do
  let(:enter_user) { User.create(
    email: 'test@example.com',
    username: 'tester',
    name: 'John Doe',
    password: 'hunter123')
  }

  it 'a user can sign in' do
    enter_user
    visit '/sign_in'
    fill_in('username', with: 'tester')
    fill_in('password', with: 'hunter123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, John Doe'
  end

  it 'a user sees an error if they get their email wrong' do
    enter_user
    visit '/sign_in'
    fill_in('username', with: 'wrongusername')
    fill_in('password', with: 'hunter123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, John Doe'
    expect(page).to have_content 'It looks like you entered your username or password wrong.'
  end

  it 'a user sees an error if they get their password wrong' do
    enter_user
    visit '/sign_in'
    fill_in('username', with: 'tester')
    fill_in('password', with: 'wrongpassword')
    click_button('Sign in')
    expect(page).not_to have_content 'Welcome, John Doe'
    expect(page).to have_content 'It looks like you entered your username or password wrong.'
  end

  it 'a user can sign out' do
    enter_user
    visit '/sign_in'
    fill_in('username', with: 'tester')
    fill_in('password', with: 'hunter123')
    click_button('Sign in')
    visit '/'
    click_link 'Sign out'

    expect(page).to have_content 'You have signed out.'
  end
end
