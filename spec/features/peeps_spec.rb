feature 'Viewing peeps' do 
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
  end
  scenario 'viewing peeps' do
    visit('/')
    click_button('see peeps')

    expect(page).to have_content "HELLO"
    expect(page).to have_content "This is my second peep"
  end

end
