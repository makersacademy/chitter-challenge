require_relative 'web_helpers'

feature 'Post Peep' do
  scenario 'Want new peep to be displayed on /peeps' do
    log_in_test
    expect(page).to have_content "Chitter - Get your Daily Peeps"
    fill_in 'Peepbox', with: "Hello, this is a really lovely test peep"
    click_button "Post Peep"
    expect(page).to have_content("Hello, this is a really lovely test peep")
  end
end