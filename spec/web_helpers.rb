def register
   visit '/'
		fill_in('first_name', with: 'Russell')
		fill_in('last_name', with: 'Vaughan')
		fill_in('username', with: 'Rusty')
		fill_in('email', with: 'Rusty@gmail.com')
		fill_in('password', with: 'secert_password123')
		fill_in('password_confirmation', with: 'secert_password123')
		click_button('submit')
end

def log_in
	visit '/login'
	expect(page.status_code).to eq 200
	fill_in('email', with: 'Rusty@gmail.com')
	fill_in('password', with: 'secert_password123')
	click_button('submit')
end

def peep
fill_in('content', with: "This is my first peep")
		click_button('Peep!')
    expect(page).to have_content("This is my first peep")
end