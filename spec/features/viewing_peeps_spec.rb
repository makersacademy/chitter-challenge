require_relative '../../app/app.rb'
require_relative '../../app/app.rb'
require_relative '../../app/models/peep.rb'

feature 'viewing peeps' do

  scenario 'homepage has list of peeps' do
    Peep.create(content: 'Hello World', user_handle: 'frosty')
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Hello World')
    end
  end
  
end

