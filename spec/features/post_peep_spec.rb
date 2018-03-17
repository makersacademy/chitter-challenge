require 'capybara/rspec'


feature 'Post a peep' do
  scenario 'the user can see an empty box' do
    visit('/')
    expect(page).to have_selector('textarea')
  end

  # scenario 'the user can post a peep' do
  #   visit('/')
  #   fill_in('peep', with: "hi, what's up?")
  #   #click_on 'Post peep'
  #   expect(page).to have_content "hi, what's up?"
  # end

end
