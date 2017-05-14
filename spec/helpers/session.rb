module SessionHelpers

def sign_in(email:, password:)
    visit '/sessions/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :password, with: password
    click_button('Rejoin the fold')
end

def sign_up
    visit '/user/new'
    expect(page.status_code).to eq(200)
    fill_in('name', with: 'Bea')
    fill_in('email', with: 'b@ttle.com')
    fill_in('username', with: 'Bcakes')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    click_button('Get Bottle')
end
def sign_up_no_email
    visit '/user/new'
    expect(page.status_code).to eq(200)
    fill_in('name', with: 'Bea')
    fill_in('username', with: 'Bcakes')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    click_button('Get Bottle')
end
def sign_up_no_username
    visit '/user/new'
    expect(page.status_code).to eq(200)
    fill_in('name', with: 'Bea')
    fill_in('email', with: 'b@ttle.com')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    click_button('Get Bottle')
end
def sign_up_incorrect_email_format
    visit '/user/new'
    expect(page.status_code).to eq(200)
    fill_in('name', with: 'Bea')
    fill_in('email', with: 'battle')
    fill_in('username', with: 'Bcakes')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    click_button('Get Bottle')
end
end
