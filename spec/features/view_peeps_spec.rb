require 'pg'

feature 'Viewing peeps' do
  scenario 'A peep can be seen' do
    visit '/peeps'
    expect(page).to have_content 'This is my example peep'
  end
end
