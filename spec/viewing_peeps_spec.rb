require 'web_helper.rb'

feature 'Viewing peeps' do
  scenario 'I can see existing peeps on the peeps page' do
    create_peep
    expect(page).to have_content('Peeps')
  end
end
