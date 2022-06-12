feature 'viewing Chitter' do
  scenario 'visit the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end

feature 'viewing peeps' do
  scenario 'a user can view peeps' do
    visit('/peeps')
    expect(page).to have_content "peep_1"
    expect(page).to have_content "peep_2"
    expect(page).to have_content "peep_3"
  end
end
