require 'pg'

feature 'Viewing feed' do 
  scenario 'A user can see all previous posts' do 
    
    ChitterFeed.post(peep: "Hello World")
    ChitterFeed.post(peep: "Hello Chitter")
    
    visit('/feed')

    expect(page).to have_content "Hello World"
    expect(page).to have_content "Hello Chitter"
  end
end
