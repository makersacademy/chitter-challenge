feature 'can see the peeps page' do
  scenario 'should be able to go to home page called peeps' do
    visit('/peep')
    expect(page).to have_content("Hello")
  end

end