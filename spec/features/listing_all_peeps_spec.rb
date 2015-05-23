feature 'User browses all current peeps' do 

  before(:each) do 
    Peeps.create(message: 'peep peep!')
  end

  scenario 'when opening the home page' do 
    visit '/'
    expect(page).to have_content('peep peep!')
  end
end