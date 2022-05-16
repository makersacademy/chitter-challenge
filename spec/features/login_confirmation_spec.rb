feature 'Logging in' do 
  scenario 'User can see they\ve logged in successfully' do
    visit ('/logged_in')

    expect(page).to have_content 'Login Successful'
  end
end 

xfeature 'Continuing to Peeps' do
  scenario 'User can click a button to see their peeps page' do
    visit ('/logged_in')
    click_button('See Peeps')
  end
end 



  