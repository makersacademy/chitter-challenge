# require '../../app.rb'

feature 'viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content("This is Chitter")
  end
end
