feature 'can post peeps' do
  scenario 'posting a peep' do
    visit ('/newpeep')
    fill_in'new peep', with: 'hello world'
    click_button 'peep'
    visit ('/peeps')
    expect(page).to have_content 'hello world'
  end
end
