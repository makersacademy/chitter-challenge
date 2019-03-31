require 'sinatra'
require 'pg'

feature "Go to the website and it exist" do
  scenario "Homepage exists" do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end
end

feature "Peeps page and form exists" do
  scenario "Finds empty field write and button post" do
    visit('/peeps')
    expect(page).to have_button("post")
    expect(page).to have_field("write")
  end
end

feature "Message fed into database and added to list" do
  scenario "message entered and returned" do
    visit('/peeps')
    fill_in("write", :with => "This is my first peep!")
    click_button("post")
    expect(page).to have_content("This is my first peep!")
  end
end
