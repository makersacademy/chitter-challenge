
feature 'posting first peep' do
  scenario 'visiting the index page' do
    visit('/')
    fill_in('peep', with: "What's up peeps?")
    click_button('Submit')
    expect(page).to have_content "What's up peeps?"
  end
end
