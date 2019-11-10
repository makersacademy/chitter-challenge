feature 'Viewing bookmarks' do
  scenario 'A user can see peeps' do
    visit('/peeps')

    expect(page).to have_content 'first peep'

  end
end
