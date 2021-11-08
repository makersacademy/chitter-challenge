feature 'authentication' do
  scenario "a user can sign in" do
    User.create(username: "kim", email: "hi@there", password: "whhaat")

    visit 'sessions/new'
    fill_in(:email, with: 'hi@there')
    fill_in(:password, with: 'whhaat')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, kim'
end

  scenario "users sees error if email is wrong" do
    User.create(username: "kim", email: "hi@there", password: "whhaat")

    visit 'sessions/new'
    fill_in(:email, with: 'hin@there')
    fill_in(:password, with: 'whhaat')

    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, hi@there'
    expect(page).to have_content 'Please check your email or password.'

  end

  scenario "user sees error if password is wrong" do
    User.create(username: "kim", email: "hi@there", password: "whhaat")

    visit 'sessions/new'
    fill_in(:email, with: 'hi@there')
    fill_in(:password, with: 'whhaant')

    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, hi@there'
    expect(page).to have_content 'Please check your email or password.'

  end

  scenario "a user can sign out" do
    User.create(username: "kim", email: "hi@there", password: "whhaat")

    visit 'sessions/new'
    fill_in(:email, with: 'hi@there')
    fill_in(:password, with: 'whhaat')

    click_button('Sign in')

    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, hi@there'
    expect(page).to have_content 'You have signed out'
  end

end