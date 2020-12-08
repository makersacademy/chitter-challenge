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

  scenario "User can delete their peeps" do
    user = User.create(username: "partario", email: "test@email.com", password: "1234")
    example_peep = Peep.create(body: "Hello World", user_id: user.id)
    visit('/')
    fill_in('username', with: 'partario')
    fill_in('password', with: '1234')
    click_button('Go online')
    expect(current_path).to eq('/app')
    first('.peep').click_button('delete')
    expect(current_path).to eq('/app')
    expect(page).not_to have_content(/Hello World/)
  end

  scenario "User can't delete other peoples peeps" do
    user = User.create(username: "partario", email: "test@email.com", password: "1234")
    example_peep = Peep.create(body: "Hello World", user_id: user.id)
    other_user = User.create(username: "partario2", email: "test2@email.com", password: "1234")
    visit('/')
    fill_in('username', with: 'partario2')
    fill_in('password', with: '1234')
    click_button('Go online')
    expect(current_path).to eq('/app')
    expect(first('.peep')).not_to have_button('delete')
    visit("/app/#{example_peep.id}/delete")
    expect(current_path).to eq('/app')
    expect(page).to have_content(/Hello World/)
  end
end
