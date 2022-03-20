feature 'Viewing peeps' do
  scenario 'user can see all peeps' do
    visit('/')
    
    expect(page).to have_content 'Hello World'
    expect(page).to have_content 'Sunny today'
  end
end