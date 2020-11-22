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
    fill_in('content', with: 'Hello World!')
    click_button('Submit')
    expect(current_path).to eq('/app')
    expect(page).to have_content(/Hello World!/)
  end

  scenario "displays an error message when over 140 characters" do
    user = User.create(username: "partario", email: "test@email.com", password: "1234")
    example_peep = Peep.create(body: "Hello World", user_id: user.id)
    visit('/')
    fill_in('username', with: 'partario')
    fill_in('password', with: '1234')
    click_button('Go online')
    expect(current_path).to eq('/app')
    click_button('New Peep')
    expect(current_path).to eq('/app/new-peep')
    fill_in('content', with: 
      'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
       AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
       AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
       AAAAAAAAA')
    click_button('Submit')
    expect(current_path).to eq('/app/new-peep')
    expect(page).to have_content(/140 characters/)
  end
end
