# As a Maker
# So that I can search for peeps which interest me 
# I want to filter peeps by tag

feature 'filtering peeps' do

  before(:each) do
  	Peep.create(content: 'Hello, chitter!', time: Time.now, tags: [Tag.first_or_create(name: 'greetings')])
    Peep.create(content: 'I love to Peep!', time: Time.now, tags: [Tag.first_or_create(name: 'love')])
    visit '/peeps'
  end
  
  scenario 'filter by a tag' do
  	fill_in 'name', with: 'greetings'
  	click_button('Search!') 

  	within 'ol#peeps' do
      expect(page).not_to have_content('I love to peep')
      expect(page).to have_content('Hello, chitter!')
    end
  end

end