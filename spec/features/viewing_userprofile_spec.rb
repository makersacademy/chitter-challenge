feature 'User profile' do
  scenario 'a user have a profile with their peeps only' do
    john = User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
    jane = User.create(name: 'Jane', username: 'jane', email: 'jane@example.com', password: 'password123')
    Peep.create(text: "Johns peep", user_id: john.id)
    Peep.create(text: "Janes peep", user_id: jane.id)

    # visit '/'
    # click_button('Login')
    visit '/sessions/new'
    fill_in('username', with: 'john')
    fill_in('password', with: 'password123')
    click_button('Login')

    # click_button('My profile')
    visit "/users/#{john.username}/peeps"
    
    expect(page).to have_content "Chitter"
    expect(page).to have_content "Johns peep"
    expect(page).not_to have_content "Janes peep"
  end
end
