feature 'Viewing all peeps' do
  scenario 'user sees all peeps on homepage' do
    visit('/peeps')
    expect(page).to have_content 'Good morning!'
    expect(page).to have_content 'This is a peep!'
  end 
end
