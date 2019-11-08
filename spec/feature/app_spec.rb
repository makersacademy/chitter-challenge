require 'capybara/rspec'

feature "Page loads" do 
  scenario "The page is able to load" do 
    visit '/'
    expect(page).to have_content "Hello World"
  end
end