feature 'sending a peep' do 
  
  let(:user) do
    User.create(email: 'user123@example.com',
		 name: 'John Smith',
		 user_name: 'JohnSmith',
		 password: '1234567',
		 password_confirmation: '1234567')
  end

   scenario 'user can send a peep' do
    sign_in(user_name: user.user_name,
	    password: user.password)
    visit '/new-peep'
    fill_in('peep', with: 'My Second Peep')
    click_button('Peep!')
    expect(page).to have_content('My Second Peep')
    click_button('Sign Out')  
 end
   scenario 'peep has a layout' do
     sign_in(user_name: user.user_name,
	    password: user.password)
     visit '/new-peep'
     fill_in('peep', with: 'My Third Peep')
     click_button('Peep!') 
     current_time = Time.now
     expect(page).to have_content("My Third Peep - #{current_time.strftime('%a, %d %b %Y %H:%M:%S')}")
   end
end
