feature 'Posting messages' do 
  scenario 'visiting the index page' do
    visit '/'
    fill_in :post_chitt, with: 'Hello Chitter World!'
    click_button 'Submit'
    save_and_open_page
    expect(page).to have_content "Hello Chitter World!"
  end
end
