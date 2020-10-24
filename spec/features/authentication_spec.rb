feature 'authentication' do
  scenario 'user can sign in' do
    User.create(name: "Mickey Smith", username: "lonelyboy", email: "mick@brokenheart.com", password: "comebackrose")
    visit('/chitter/sessions/new')
    fill_in :email, with: "mick@brokenheart.com"
    fill_in :password, with: "comebackrose"
    click_button "Sign in"
    expect(page).to have_content "Mickey Smith"
  end

  scenario 'user enters incorrect email' do
    User.create(name: "Karen", username: "shopaholic", email: "karen@entitled.com", password: "theworst")
    visit '/chitter/sessions/new'
    fill_in :email, with: 'karen@incorrect.com' 
    fill_in :password, with: 'theworst'
    click_button('Sign in')
    
    expect(page).not_to have_content "Karen"
    expect(page).to have_content "Check your email or password."
  end

  scenario 'user enters incorrect password' do
    User.create(name: "Karen", username: "shopaholic", email: "karen@entitled.com", password: "theworst")
    visit '/chitter/sessions/new'
    fill_in :email, with: 'karen@entitled.com' 
    fill_in :password, with: 'thebest'
    click_button('Sign in')

    expect(page).not_to have_content "Karen"
    expect(page).to have_content "Check your email or password."
  end
end