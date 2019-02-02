feature 'Viewing posts' do
  scenario 'check there are posts listed' do
    visit('/posts')

    expect(page).to have_content "Test chit 01"
    expect(page).to have_content "Test chit 02"
    expect(page).to have_content "Test chit 03"
  end
end
