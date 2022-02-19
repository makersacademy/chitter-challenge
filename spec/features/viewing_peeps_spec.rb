require_relative 'web_helpers'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    login
    visit '/peeps/new'
    fill_in :peep, with: 'Second peep'
    click_button "submit"
    expect(page).to have_content ("First peep")
    expect(page).to have_content ("Second peep")
  end
end

# '2016-06-22 19:10:25-07'
