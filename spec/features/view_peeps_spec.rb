# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'view peeps' do

  before(:each) do
  	Peep.create(content: 'Hello, chitter!', time: Time.now)
    Peep.create(content: 'I love to Peep!', time: Time.now)
    visit '/peeps'
  end
	
  scenario 'can view a list of all previous peeps' do
	within 'ol#peeps' do
      expect(page).to have_content("Hello, chitter!")
	end
  end

  scenario 'peeps appear in reverse chronological order' do
    expect(page.find('li:nth-child(1)')).to have_content 'I love to Peep!'
  end

  scenario 'peeps are marked with their time of creation' do
  	expect(page.find('li:nth-child(1)')).to have_content Time.now.strftime("%H:%M:%S, %d %B %Y")
  end

end