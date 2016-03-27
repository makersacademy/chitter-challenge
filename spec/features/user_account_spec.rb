feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change { User.count }.by 1
    expect(page).to have_content 'Welcome Bob!'
    expect(User.first.email).to eq 'bob.by@gmail.com'
  end

  scenario 'with an email address that is already taken' do
    create_user
    expect { sign_up(first_name: 'Mark') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'We already have that email.'
  end
end

feature 'User sign in' do
  scenario 'with the correct details' do
    create_user
    sign_in
    expect(page).to have_content 'Welcome Bob!'
  end

  scenario 'with wrong password' do
    create_user
    visit '/sessions/new'
    fill_in :email, with: 'bob.by@gmail.com'
    fill_in :password, with: 'wrong password'
    click_button 'Sign in'
    expect(page).to have_content 'Login details do not match :('
  end

  scenario 'with wrong username' do
    create_user
    visit '/sessions/new'
    fill_in :email, with: 'not_my@email.com'
    fill_in :password, with: 'wrong-password'
    click_button 'Sign in'
    expect(page).to have_content 'Login details do not match :('
  end
end

feature 'User sign out' do
 scenario 'while being signed in' do
   create_user
   sign_in
   click_button 'Sign out'
   expect(page).to have_content('Goodbye')
   expect(page).not_to have_content 'Welcome Bob!'
 end
end
