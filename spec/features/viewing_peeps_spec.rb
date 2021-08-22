feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit ('/')
    expect(page).to have_content'Peeps'
  end

  scenario 'a user can see peeps' do
    visit ('/peeps')
    expect(page).to have_content'my first peep'
    expect(page).to have_content'my second peep'
  end
end