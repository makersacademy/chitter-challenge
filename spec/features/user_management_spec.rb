feature 'User sign-up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, pete@example.com')
    expect(User.first.email).to eq('pete@example.com')
  end

  scenario 'password confirmation doesnt match' do
    visit '/users/new'
    fill_in 'name', with: 'Pete Smith'
    fill_in 'email', with: 'pete@example.com'
    fill_in 'username', with: 'peteypops'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'notmatching'
    expect{click_button 'Sign up'}.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'email is blank' do
    visit '/users/new'
    fill_in 'name', with: 'Pete Smith'
    fill_in 'username', with: 'peteypops'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    expect{click_button 'Sign up'}.not_to change(User, :count)
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'email is an invalid format' do
    visit '/users/new'
    fill_in 'name', with: 'Pete Smith'
    fill_in 'email', with: 'pete@example'
    fill_in 'username', with: 'peteypops'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    expect{click_button 'Sign up'}.not_to change(User, :count)
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'cant sign up twice with same email address' do
    sign_up
    visit '/users/new'
    fill_in 'name', with: 'Pete Jones'
    fill_in 'email', with: 'pete@example.com'
    fill_in 'username', with: 'peteypops2'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    expect{click_button 'Sign up'}.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'username must be unique' do
    sign_up
    visit '/users/new'
    fill_in 'name', with: 'Pete Jones'
    fill_in 'email', with: 'pete2@example.com'
    fill_in 'username', with: 'peteypops'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    expect{click_button 'Sign up'}.not_to change(User, :count)
    expect(page).to have_content 'Username is already taken'
  end
end
