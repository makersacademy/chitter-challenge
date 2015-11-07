feature 'Signing up:' do
  scenario 'User can sign up' do
    visit '/users/new'
    expect(page.status_code).to eq(200)
    expect {sign_up}.to change(User, :count).by 1
    expect(page).to have_content('Hi, Yev Insomniak')
    expect(User.first.email).to eq('incredible@yev.com')
  end

  scenario 'Requires a matching confirmation password' do
    expect {sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq ('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "User can't sign up without an email address" do
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name, with: 'Yev Insomniak'
    fill_in :username, with: 'yev_insomniak'
    fill_in :password, with: 'bla-bla-bla'
    fill_in :password_confirmation, with: 'bla-bla-bla'
    click_button 'Sign up!'
    expect(page).to have_content('Email must not be blank')
  end

  scenario "User can't sign up without a valid email address" do
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name, with: 'Yev Insomniak'
    fill_in :username, with: 'yev_insomniak'
    fill_in :email, with: 'incredibleyev.com'
    fill_in :password, with: 'bla-bla-bla'
    fill_in :password_confirmation, with: 'bla-bla-bla'
    click_button 'Sign up!'
    expect(page).to have_content("Doesn't look like an email address to me")
  end

  scenario "Can't sign up twice with the same email address" do
    sign_up
    sign_up(name: 'Another Yev',
            username: 'another_yev',
            password: 'alb-alb-alb',
            password_confirmation: 'alb-alb-alb')
    expect(page).to have_content "Email is already taken"
  end

  scenario "Can't sign up twice with the same username" do
    sign_up
    sign_up(name: 'Another Yev',
            email: 'another@yev.com',
            password: 'alb-alb-alb',
            password_confirmation: 'alb-alb-alb')
    expect(page).to have_content "Username is already taken"
  end
end