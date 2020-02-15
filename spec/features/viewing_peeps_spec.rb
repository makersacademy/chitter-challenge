feature 'viewing peeps' do
  scenario 'a user can view their peeps' do
    visit('/peeps')
    expect(page).to have_content("Hello!")
    expect(page).to have_content("Hello again!")
  end
end
