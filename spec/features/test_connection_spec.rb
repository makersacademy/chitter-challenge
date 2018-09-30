
feature 'Should print hello to page' do 
  scenario 'print hello' do
    visit('/')
    expect(page).to have_content('hello')
  end 
end 
