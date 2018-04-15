module Helpers

def sign_in({:user => 'lsaunders', :password => 'lsaunders123'})

    visit('/chitter')
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in"
    
end
