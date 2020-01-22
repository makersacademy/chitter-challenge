feature 'Sign up' do
  scenario 'A user can sign up to Chitter' do
    visit '/users/new'
    fill_in('email',with: 'example@example.com')
    fill_in('password',with: 'example123')
    fill_in('name',with: 'Example Surname')
    fill_in('username',with: 'exampleusername')
    click_button('Sign Up')

    expect(page).to have_content "Welcome, Example Surname"
  end

  scenario 'A user without unique email cannot sign up to Chitter' do
    visit '/users/new'
    fill_in('email',with: 'example@example.com')
    fill_in('password',with: 'example123')
    fill_in('name',with: 'Example Surname')
    fill_in('username',with: 'exampleusername')
    click_button('Sign Up')

    expect(page).to have_content "Welcome, Example Surname"
    visit '/users/new'
    fill_in('email',with: 'example@example.com')
    fill_in('password',with: 'example124')
    fill_in('name',with: 'Example Name')
    fill_in('username',with: 'examplename')
    click_button('Sign Up')

    #500 status code means something has gone wrong on the website server
    expect(page.status_code).to eq(500)

  end

  scenario 'A user without unique username cannot sign up to Chitter' do
    visit '/users/new'
    fill_in('email',with: 'example@example.com')
    fill_in('password',with: 'example123')
    fill_in('name',with: 'Example Surname')
    fill_in('username',with: 'exampleusername')
    click_button('Sign Up')

    expect(page).to have_content "Welcome, Example Surname"
    visit '/users/new'
    fill_in('email',with: 'different@example.com')
    fill_in('password',with: 'differentpassword')
    fill_in('name',with: 'Different Name')
    fill_in('username',with: 'exampleusername')
    click_button('Sign Up')

    #500 status code means something has gone wrong on the website server
    expect(page.status_code).to eq(500)

  end


end
