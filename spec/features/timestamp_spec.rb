feature 'timestamp' do
  scenario 'User can see when a peep was posted by looking at the timestamp' do
    visit '/chitter/home'
    fill_in('newpeep', with: "")
    fill_in('newpeep', with: "This peep is for test purposes. Please do not take it seriously.")
    click_on('Submit')
    expect(page).to have_content "Peeptime: "
  end
end
