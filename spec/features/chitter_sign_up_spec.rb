feature 'user sign up options' do
  scenario 'the user is not signed up' do
    visit('/')
    expect(page).to have_content 'Sign up'
    find('button.sign-up').click
    expect(current_path).to eq '/users/new'
  end

  scenario 'the user is signed up' do
    visit('/')
    find('button.sign-up').click
    sign_up
    expect(page).to have_field 'message'
  end

  scenario 'the user cannot sign up because email or username already in use' do
    Chitter.create_user('test@test.com', 'password', 'John Doe', 'J')
    visit('/')
    expect(page).to have_content 'Sign up'
    find('button.sign-up').click
    sign_up
    expect(page).to have_content 'email or username already in use'
    expect(page).to_not have_field 'message'
  end
end
