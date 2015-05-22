feature 'User views all peeps' do

  before(:each) do
    Peep.create(text: 'Look at my breakfast, lolz')
  end

  scenario 'When opening the home page' do
    visit '/'
    expect(page).to have_content('Look at my breakfast, lolz')
  end

end