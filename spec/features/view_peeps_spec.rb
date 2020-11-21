feature "Timeline" do
  scenario "Shows a timeline of one tweet" do
    user = User.create(username: "partario", email: "test@email.com", password: "1234")
    example_peep = Peep.create(body: "Hello World", user_id: user.id)
    visit('/')
    fill_in('username', with: 'partario')
    fill_in('password', with: '1234')
    click_button('Go online')
    expect(current_path).to eq('/app')
    expect(page).to have_content(/Hello World/)
  end
end