require 'capybara/rspec'
# require './app/models/posts.rb'


feature "being on the home page" do
  scenario "the page is the home page" do
    visit ('/home')
    expect(page).to have_content "WELCOME TO CHITTER!"
  end
end


feature "Add a new comment" do
  scenario "the page has a button to add a comment" do
    visit ('/add_comment')
    expect(page).to have_content "Submit your comment"
  end
end
