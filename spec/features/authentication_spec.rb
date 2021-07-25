feature 'Authentication' do

  scenario 'A user can sign in' do
    User.create(email: 'example@example.co.uk', password: 'password')
    visit '/sessions/new'
    fill_in(:email, with: 'example@example.co.uk')
    fill_in(:password, with: 'password')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, example@example.co.uk'
  end

  scenario "Doesn't let user sign in if they have the wrong email" do
    User.create(email: 'example@example.co.uk', password: 'password')
    visit '/sessions/new'
    fill_in(:email, with: 'wrongemail@example.co.uk')
    fill_in(:password, with: 'password')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, example@example.co.uk'
    expect(page).to have_content "We don't recognise your email or password please try again"
  end

  scenario "Doesn't let user sign in if they have the wrong password" do
    User.create(email: 'example@example.co.uk', password: 'password')
    visit '/sessions/new'
    fill_in(:email, with: 'examplel@example.co.uk')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, example@example.co.uk'
    expect(page).to have_content "We don't recognise your email or password please try again"
  end

end
