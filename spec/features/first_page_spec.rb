require "capybara/rspec"

feature 'homepage' do
    scenario 'I should be able to visit the homepage' do
        visit '/' 
        expect(page).to have_content("Welcome to Chitter!")
    end
end