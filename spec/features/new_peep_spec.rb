feature "New peep" do
  scenario "allows a user to create a new peep" do
    user = User.create(username: "partario", email: "test@email.com", password: "1234")
    example_peep = Peep.create(body: "Hello World", user_id: user.id)
    visit('/')
    fill_in('username', with: 'partario')
    fill_in('password', with: '1234')
    click_button('Go online')
    expect(current_path).to eq('/app')
    click_button('New Peep')
    expect(current_path).to eq('/app/new-peep')
    fill_in('body', with: 'Hello World!')
    click_button('Post Peep')
    expect(current_path).to eq('/app')
    expect(page).to have_content(/Hello World!/)
  end
end