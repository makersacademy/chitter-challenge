feature 'Visiting the home page' do
  scenario 'a user can see all peeps' do
    visit '/'
    expect(page).to have_content 'First peep'
    expect(page).to have_content 'Second peep'
    expect(page).to have_content 'Third peep'
  end
end
