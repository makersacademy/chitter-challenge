feature 'Post a peep' do
  before(:each) do
    User.create(
      name: "Bob",
      username: "bigbob",
      email: "Bob@email.com",
      password: "123abc",
      password_confirmation: "123abc"     
    )
  end

  scenario 'users can post a peep' do
    log_in(email: "Bob@email.com", password: "123abc")
    fill_in :peep, with: "Hello, world!"
    click_button 'Post'
    expect(page).to have_content "Hello, world!"
  end
end
