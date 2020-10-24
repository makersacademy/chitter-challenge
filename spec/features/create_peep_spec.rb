feature 'post peeps' do
  scenario 'User can post messages to chitter and see them displayed' do
    visit '/home'
    fill_in('newpeep', with: "")
    fill_in('newpeep', with: "This peep is for test purposes. Please do not take it seriously.")
    click_on('Submit')
    expect(page).to have_content "This peep is for test purposes. Please do not take it seriously."
  end
end
