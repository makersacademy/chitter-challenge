feature 'authentication' do
  scenario 'user can sign in' do
    create_karen
    fill_in :email, with: "karen@entitled.com"
    fill_in :password, with: "theworst"
    click_button "Sign in"
    expect(page).to have_content "Karen"
  end

  scenario 'user enters incorrect email' do
    create_karen
    fill_in :email, with: 'karen@incorrect.com' 
    fill_in :password, with: 'theworst'
    click_button('Sign in')
    
    expect(page).not_to have_content "Karen"
    expect(page).to have_content "Check your email or password."
  end

  scenario 'user enters incorrect password' do
    create_karen
    fill_in :email, with: 'karen@entitled.com' 
    fill_in :password, with: 'thebest'
    click_button('Sign in')

    expect(page).not_to have_content "Karen"
    expect(page).to have_content "Check your email or password."
  end

  scenario 'user can sign out' do
    create_karen
    fill_in :email, with: 'karen@entitled.com' 
    fill_in :password, with: 'theworst'
    click_button('Sign in')
    click_button('Sign out')
    expect(page).not_to have_content "Karen"
    expect(page).to have_content "Logged out"
  end
end
