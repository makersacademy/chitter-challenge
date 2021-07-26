feature 'posting first peep' do
  scenario 'visiting the index page' do
    visit('/')
    fill_in('peep', with: "What's up peeps?")
    click_button('Submit')
    expect(page).to have_content "What's up peeps?"
  end
end

feature 'viewing a list of peeps' do
  scenario 'finding a list of previous tweets' do
    visit('/')
    click_button('Submit')
    expect(page).to have_content "Hi, I'm peep three"
    expect(page).to have_content "Hi, I'm peep two"
    expect(page).to have_content "Hi, I'm peep one"
  end
end
