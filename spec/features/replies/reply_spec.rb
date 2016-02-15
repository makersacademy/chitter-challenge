feature 'Reply' do
  before(:each) do
    User.create(
      name: "Joe",
      username: "joejoe",
      email: "joe@email.com",
      password: "abc",
      password_confirmation: "abc"  
    )
  end

  scenario 'users can reply to peeps from other users' do
    create_peep
    log_in(email: "joe@email.com", password: "abc")
    click_link "Reply"
    fill_in :reply, with: "Hey Bob!"
    click_button "Reply"
    expect(page).to have_content "Hey Bob!"
  end
end
