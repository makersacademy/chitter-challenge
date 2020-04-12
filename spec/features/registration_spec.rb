feature 'Registration' do
  scenario 'a user can sign up' do
    dave_sign_up
    
    expect(current_path).to eq '/'
    expect(page).to have_content '@davedude'
    expect(page).to_not have_content 'Sign up'
  end

  scenario 'Attempting to sign up with an email that already exists will raise a notice' do
    user_create_dave

    visit '/'
    click_on 'Sign up'
    
    fill_in('first_name', with: 'Jim')
    fill_in('last_name', with: 'Guy')
    fill_in('email', with: 'davedude@example.com')
    fill_in('user_name', with: 'jimguy')
    fill_in('password', with: 'password123')
    click_on 'Submit'

    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'There is already a user with that email'
  end

  scenario 'Attempting to sign up with a username that already exists will raise a notice' do
    user_create_dave

    visit '/'
    click_on 'Sign up'
    
    fill_in('first_name', with: 'Jim')
    fill_in('last_name', with: 'Guy')
    fill_in('email', with: 'jimguy@example.com')
    fill_in('user_name', with: 'davedude')
    fill_in('password', with: 'password123')
    click_on 'Submit'

    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'There is already a user with that email or username'
  end
end
