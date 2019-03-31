feature 'The user can sign up to Chitter' do
  scenario 'the user can sign up through the button on the index page' do
    visit('/')
    click_button('Sign up')
    expect(current_path).to eq "/chitter/signup"
  end

  scenario 'the user can sign up with name, handle, email and password' do
    visit('/')
    click_button('Sign up')
    expect(current_path).to eq "/chitter/signup"
    fill_in('name', with: 'Tom Marvollo Riddle')
    fill_in('handle', with: 'youKnowWho')
    fill_in('email', with: 'basilisk@hogwarts.edu')
    fill_in('password', with: 'harrypotter')
    click_button('Submit')
    expect(current_path).to eq "/chitter"
  end
end
