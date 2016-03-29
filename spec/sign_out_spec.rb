feature 'User signs out' do

  before do
    create_user
  end

  scenario 'when signed in' do
    visit '/sessions/new'
    fill_in :email, with: 'colin@colin.com'
    fill_in :password, with: 'colinpw'
    click_button 'Sign in'
    click_button 'Sign out'
    expect(page).to have_content 'goodbye'
  end
end

