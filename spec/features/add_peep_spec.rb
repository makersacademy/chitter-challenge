require 'pg'


feature 'allow user to add peeps' do 
  scenario 'add peeps' do 
    visit('/feed/comment')
    fill_in :peep, with: "Hello World"
    click_button("Submit")
    expect(page).to have_content "Hello World" 
  end
end
