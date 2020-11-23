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
    expect(first('.peep')).to have_button('Favourite')
  end

  scenario "count updates on click" do
    user = User.create(username: "partario", email: "test@email.com", password: "1234")
    Peep.create(body: "Hello World", user_id: user.id)
    visit('/')
    fill_in('username', with: 'partario')
    fill_in('password', with: '1234')
    click_button('Go online')
    first('.favourite-count').click_button('Favourite')
    expect(first('.favourite-count')).to have_content('1')
  end

  scenario "unfavourite button displayed if tweet favourited" do
    user = User.create(username: "partario", email: "test@email.com", password: "1234")
    Peep.create(body: "Hello World", user_id: user.id)
    visit('/')
    fill_in('username', with: 'partario')
    fill_in('password', with: '1234')
    click_button('Go online')
    first('.favourite-count').click_button('Favourite')
    expect(first('.favourite-count')).to have_content('1')
    expect(first('.peep')).to have_button('Unfavourite')
  end

  scenario "unfavourite button works and displays favourite button again" do
    user = User.create(username: "partario", email: "test@email.com", password: "1234")
    Peep.create(body: "Hello World", user_id: user.id)
    visit('/')
    fill_in('username', with: 'partario')
    fill_in('password', with: '1234')
    click_button('Go online')
    first('.favourite-count').click_button('Favourite')
    expect(first('.favourite-count')).to have_content('1')
    first('.peep').click_button('Unfavourite')
    expect(first('.favourite-count')).to have_content('0')
    expect(first('.peep')).to have_button('Favourite')
  end
end
