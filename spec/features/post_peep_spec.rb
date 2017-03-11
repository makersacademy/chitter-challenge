require 'date'

feature "User can sign in and post peeps" do

  given(:user) {User.create(email: 'test@test.com', password: 'test', password_confirmation: 'test', name: 'Ex Name', username: 'ename')}

  scenario "allows user to post a peeps" do
    sign_in(email: user.email, password: user.password)
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

  scenario "doesn't allow user to post a short or long peep" do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_current_path '/peeps'
    expect(page).to have_content "Welcome, #{user.username}"
    click_button 'Post Peep'
    expect(page).to have_current_path('/peeps/new')
    fill_in :text, with: 'Short one'
    click_button 'Submit'
    expect(page).to have_current_path '/peeps/new'
    expect(page).to have_content ('Please make sure your peep has between 10 and 140 chars')
  end

end
