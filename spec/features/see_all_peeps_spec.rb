feature 'view all the peeps' do
  scenario 'a user can see all the peeps from the other people' do
    visit('/')
    expect(page).to have_content "Hello Chitter! 2018-03-18 10:05:20"
    expect(page).to have_content "My first peep 2018-03-17 20:24:00"
    expect(page).to have_content "It is snowing again 2018-03-17 12:19:05"
  end
end
