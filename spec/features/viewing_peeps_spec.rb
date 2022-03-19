feature 'Homepage' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end

feature 'viewing peeps' do
  scenario 'visiting the bookmark page' do
    visit('/bookmarks')
    
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end