feature 'chitter homepage' do
  scenario 'the page show all messages' do
    user = Chitter.create_user('test@test.com', 'password', 'John Doe', 'J')
    Chitter.create_message('Hello', user)
    visit('/')
    expect(page).to have_content 'Hello'
  end

  scenario 'the user is not signed up' do
    visit('/')
    expect(page).to have_content 'Sign up or sign in to post a peep'
    click_button('Sign up')
    expect(current_path).to eq '/users/new'
  end

  scenario 'the user is signed up' do
    visit('/')
    click_button('Sign up')
    sign_up
    expect(page).to have_content 'Insert the message:'
  end

  scenario 'the user cannot sign up because email or username already in use' do
    Chitter.create_user('test@test.com', 'password', 'John Doe', 'J')
    visit('/')
    click_button('Sign up')
    sign_up
    expect(page).to have_content 'email or username already in use'
    expect(page).to_not have_content 'Insert the message:'
  end

  scenario 'the user log in' do
    visit('/')
    click_button('Sign in')
    sign_in_correct
    expect(page).to have_content 'All peeps:'
  end
end
