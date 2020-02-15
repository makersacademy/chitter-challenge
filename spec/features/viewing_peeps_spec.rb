feature 'viewing peeps' do
  scenario 'user visits app' do
    Peep.create(text: 'My first peep', username: 'lookupdaily')
    visit '/'
    expect(page).to have_content "My first peep" 
  end
end
