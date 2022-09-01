require 'pg'

feature 'Viewing peeps' do
  scenario 'A peep can be seen' do
    Peep.create(message: 'This is my example peep')
    visit '/peeps'
    expect(page).to have_content 'This is my example peep'
  end
end
