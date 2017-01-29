feature '7: account validation' do

  scenario 'cannot have two accounts with the same username' do

    sign_up

    visit '/'
    click_link('Sign up')
    fill_in(:name, with: 'Katherine')
    fill_in(:username, with: 'katmhicks')
    fill_in(:email, with: 'katherine_m_hicks@hotmail.com')
    fill_in(:password, with: '6789')
    fill_in(:confirm_password, with: '6789')
    click_button('Submit')

    expect( page ).to have_content('Chosen username is already in use.')
    expect( page ).not_to have_content('Logged in as Katherine')

  end

  scenario 'cannot have two accounts with the same email' do

    sign_up

    visit '/'
    click_link('Sign up')
    fill_in(:name, with: 'Katherine')
    fill_in(:username, with: 'khicks')
    fill_in(:email, with: 'kmhicks92@gmail.com')
    fill_in(:password, with: 'abcde')
    fill_in(:confirm_password, with: 'abcde')
    click_button('Submit')

    expect( page ).to have_content('Account with that email already exists.')
    expect( page ).not_to have_content('Logged in as Katherine')

  end

  scenario 'two passwords entered on sign up must match' do

    visit '/'
    click_link('Sign up')
    fill_in(:name, with: 'Kat')
    fill_in(:username, with: 'katmhicks')
    fill_in(:email, with: 'kmhicks92@gmail.com')
    fill_in(:password, with: 'abcde')
    fill_in(:confirm_password, with: '12345')
    click_button('Submit')

    expect( page ).to have_content('Password and confirmation password do not match.')
    expect( page ).not_to have_content('Logged in as Kat')

  end

  scenario 'must enter an email in order to sign up' do

    visit '/'
    click_link('Sign up')
    fill_in(:name, with: 'Kat')
    fill_in(:username, with: 'katmhicks')

    fill_in(:password, with: '1234')
    fill_in(:confirm_password, with: '1234')
    click_button('Submit')

    expect( page ).to have_content('You must enter an email to sign up.')
    expect( page ).not_to have_content('Logged in as Kat')

  end

  scenario 'must enter a valid email in order to sign up' do

    visit '/'
    click_link('Sign up')
    fill_in(:name, with: 'Kat')
    fill_in(:username, with: 'katmhicks')
    fill_in(:email, with: 'kmhicks92@gmail')
    fill_in(:password, with: '1234')
    fill_in(:confirm_password, with: '1234')
    click_button('Submit')

    expect( page ).to have_content('You must enter a valid email to sign up.')
    expect( page ).not_to have_content('Logged in as Kat')

  end

end
