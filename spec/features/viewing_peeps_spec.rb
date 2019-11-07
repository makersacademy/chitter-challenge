feature 'Viewing Peeps' do
  scenario 'Visit home page' do
    visit ('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end
