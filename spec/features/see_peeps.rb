require 'app.rb'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/')

    expect(page).to have_content "this is a peep"
    expect(page).to have_content "this is another peep"
    expect(page).to have_content "not another one"
  end
end