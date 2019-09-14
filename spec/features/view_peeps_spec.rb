feature 'view all Peeps' do
  scenario 'A user can see all peeps on one page' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
    expect(page).to have_content 'This is my first Peep'
    expect(page).to have_content 'Peeping to my peeps'
  end
end
