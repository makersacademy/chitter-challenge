feature 'View all peeps' do
  scenario 'A user can see all peeps' do
    visit '/'
    expect(page).to have_content "Hello World!"
    expect(page).to have_content "I am feeling sunny today!"
    expect(page).to have_content "Minions will takeover the world."
  end
end
