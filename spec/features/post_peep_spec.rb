require 'date'

feature "User can sign in and post peeps" do

  scenario "allows user to post a peeps" do
    user = User.create(email: 'test@test.com', password: 'test', password_confirmation: 'test', name: 'Ex Name', username: 'ename')
    visit ('/session/new')
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Sign In'
    expect(page).to have_current_path '/peeps'
    expect(page).to have_content "Welcome, #{user.username}"
    click_button 'Post Peep'
    expect(page).to have_current_path('/peeps/new')
    fill_in :text, with: 'This is my very first peep'
    click_button 'Submit'
    expect(page).to have_current_path '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('This is my very first peep')
      expect(page).to have_content('Ex Name')
      expect(page).to have_content('ename')
      expect(page).to have_content "#{DateTime.now.strftime('%M')}"
    end

  end

end
