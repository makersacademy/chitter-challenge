require_relative'web_helper.rb'

feature 'multiple users can sign up' do
  scenario 'user count increases by 1 and welcome message is shown' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, lil.gmail.com"
  end
end

feature 'users need to sign up with unique email' do
  scenario 'shows error if email or username is in use' do
    sign_up
    click_button 'Sign out'
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content "Email is already taken Username is already taken"
  end
end

feature 'User sign in' do
  new_user
  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, lilian.gmail.com"
  end
end

feature 'User signs out' do
  new_user
  scenario 'while being signed in' do
    sign_in(email: 'lilian.gmail.com', password: 'lemonaid')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, lilian.gmail.com')
end
end

  feature 'User can write a peep' do
    new_user
    scenario "adds peep" do
      sign_in(email: user.email, password: user.password)
      visit '/peep_new'
      fill_in 'peep', with: 'Driinking chocolate'
      click_button "Post peep"
      expect(page).to have_text('Driinking chocolate')
    end
  end

  feature 'Peeps have the creators name' do
    new_user
    scenario "can see name of peep" do
      sign_in(email: user.email, password: user.password)
      visit '/peep_new'
      fill_in 'peep', with: 'Driinking chocolate'
      click_button "Post peep"
      expect(page).to have_text('Lilian Breidenbach')
    end
  end
