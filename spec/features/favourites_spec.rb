require 'capybara/rspec'

feature "Favourites" do
  scenario "each peep has a favourite button and a counter" do
    user = User.create(username: "partario", email: "test@email.com", password: "1234")
    Peep.create(body: "Hello World", user_id: user.id)
    visit('/')
    fill_in('username', with: 'partario')
    fill_in('password', with: '1234')
    click_button('Go online')
    expect(first('.peep')).to have_css('.favourite-count')
  end
end