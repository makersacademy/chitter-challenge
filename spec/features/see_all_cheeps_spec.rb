feature 'user sees list of all cheeps in reverse chronological order' do
  scenario 'user can see list of all cheeps' do
    add_cheep('Test Post 1')
    add_cheep('Test Post 2')
    expect(page).to have_content 'Test Post 1'
    expect(page).to have_content 'Test Post 2'
  end
  scenario 'cheeps are in reverse chronological order' do
    add_cheep('Test Post 1')
    add_cheep('Test Post 2')
    expect(page.body.index('Test Post 2')).to be < page.body.index('Test Post 1')
  end
end
