feature 'Post information to page' do 
  scenario 'I want to post information to a page' do 
    visit('/home')
    fill_in('user_name', with: 'andy')
    fill_in('message', with: "My first chit")
    click_on('submit')
    expect(page).to have_content('My first chit')
    expect(page).to have_content('andy')
  end

  scenario 'I want to be able to see the time a tweet was made' do

  end
end 
