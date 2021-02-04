feature "registrations page loading" do
  scenario "user visits homepage" do
  
    visit('/registrations/new')
    expect(page).to have_content("Welcome To Chitter")
  end
end

feature 'registrations confirmation' do 
  scenario 'user can sign up and receive confirmation message' do 

    visit('/registrations/new')
    fill_in('name', with: 'maverick')
    fill_in('email', with: 'maverick@hotmail.co.uk')
    fill_in('password', with: 'blah')
    click_button('Submit')

    visit('/registrations/confirmation')
    expect(page).to have_content("You are now signed up to Chitter!")
  end
end

