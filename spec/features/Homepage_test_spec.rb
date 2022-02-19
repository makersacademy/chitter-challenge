require 'capybara'

feature 'Show homepage saying Welcome to chitter' do
    scenario 'See the words Welcome to chitter on the homepage' do
        visit('/')
        expect(page).to have_content "Welcome to Chitter"
    end
end
    