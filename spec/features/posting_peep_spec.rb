feature 'Posting Peeps' do
  scenario 'can see peep I\'ve just posted' do
    peep = Peep.create(username:"Danusia.x", content:"Hello Chitter!")
    visit '/'
    expect(page).to have_content "Danusia.x"
    expect(page).to have_content "Hello Chitter!"
  end
end
