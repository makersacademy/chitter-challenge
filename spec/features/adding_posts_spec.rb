feature 'Adding posts' do
  scenario 'can post a new message when signed in' do
    User.create(name: "Test Name", username: "Test username",
      email: "test@test.com", password: "password123"
    )

    visit('/')
    click_button 'Sign In'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password123'
    click_button 'Sign In'
    click_button 'Write Peep'

    expect(current_path).to eq '/write-peep'
    expect(page).to have_content 'New peep:'

    fill_in 'content', with: "Writing a new peep"
    click_button 'Post'

    expect(current_path).to eq '/'
    expect(page).to have_content "Writing a new peep"
  end

  scenario 'unable to post a new message when not signed in' do
    visit('/')
    click_button 'Write Peep'

    expect(current_path).to eq '/'
    expect(page).to have_content "You must be signed in to write a Peep!"
  end

end
