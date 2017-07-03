feature 'viewing peeps' do
    before(:each) do	
	  Peep.create(text: 'Trial')
    Peep.create(text: 'Trial2')
    Peep.create(text: 'Trial3')
  end 
  scenario 'in the homepage' do
    visit '/peeps'
    expect(page).to have_content 'Trial' 
  end 
end 
