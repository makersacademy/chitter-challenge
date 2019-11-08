require 'capybara/rspec'
require './spec/database_helpers'

feature "Page loads" do 
  scenario "The page is able to load" do 
    visit '/'
    expect(page).to have_content "Hello World"
  end
end


feature "Peeps" do
  scenario "Can store new peeps" do
    visit '/new_peep'
    fill_in('title', with: 'New Peep')
    fill_in('body', with: 'This is a test peep')
    click_button("submit")
    expect(page).to have_content "New Peep"
    expect(page).to have_content "This is a test peep"
  end

  scenario "Can view peeps" do
    create_post
    visit '/home'
  end
end

feature "Users" do
  scenario "Can log in" do
    visit '/login'
    fill_in('username', with: 'bradley')
    fill_in('password', with: 'bradley')
    click_button('submit')
    expect(page).to have_content "Welcome Bradley"
  end
end


