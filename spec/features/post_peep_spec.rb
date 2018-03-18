require 'capybara/rspec'

feature 'Posting a peep' do
  scenario 'the user can see an empty input field' do
    visit('/')
    expect(page).to have_selector('textarea')
  end

  scenario 'the user can write and post a peep' do
    visit('/')
    fill_in('text', with: "test_peep")
    click_on 'Post peep'
    expect(page).to have_content "test_peep"
  end

end
