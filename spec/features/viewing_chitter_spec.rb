feature 'Viewing peeps' do
  scenario 'visit the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end

  scenario 'user can see peeps' do
    visit('/')
    click_button "Add Peep"

    expect(page).to have_content "What a day to peep!"
    expect(page).to have_content "Happy Easter"
  end
end