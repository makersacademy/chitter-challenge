feature 'View peeps' do
  scenario 'A user can see multiple peeps' do
    visit('/peeps')
    expect(page).to have_content 'This is my peep'
    expect(page).to have_content 'Another peep'
    expect(page).to have_content 'Third peep'
  end
end
