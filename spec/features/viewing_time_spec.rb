feature 'viewing time that peeps are posted' do
  scenario 'each peep has a time' do 
    Peep.add(content: "This is a test peep", time: '12:00')
    visit '/peeps'

    expect(page).to have_content 'at 12:00'
  end
end
