feature 'see all peeps' do
  scenario 'allows user to view all peeps' do
    visit '/'

    expect(page).to have_content('This is my peep')
    expect(page).to have_content('This is my second peep')
    expect(page).to have_content('This is my third peep')
  end
end
