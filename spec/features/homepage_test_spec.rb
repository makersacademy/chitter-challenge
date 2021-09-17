feature 'Test index page works' do 
  scenario 'can run app' do 
    visit('/')
    expect(page).to have_content 'Welcome'
  end
end
