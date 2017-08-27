
require_relative '../../app/app.rb'
require_relative '../../app/models/peep.rb'

feature 'viewing peeps' do

  scenario 'homepage has list of peeps' do
    t = Time.now
    Peep.create(content: 'Hello World', user_handle: 'frosty', name: 'Olivia')
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Hello World')
    end
  end

  # scenario 'peeps are in reverse chronological order' do
  # end
  
  scenario 'peeps have a date and time' do
    peep = Peep.create(content: 'Hello World', user_handle: 'frosty', name: 'Olivia')
    peep.save
    visit '/peeps'
    expect(page).to have_text (peep.created_at)
  end
  
  
end

 