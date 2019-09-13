require './app.rb'

feature 'it checks if there is a form on the homepage' do
  scenario 'fills in  a form for  a massage' do
    visit('/')
    fill_in('name', with: 'Bill')
    fill_in('Message', with: 'I am busy')
    click_button('Submit')
    expect(page).to have_content 'Bill says: I am busy'
  end
end
