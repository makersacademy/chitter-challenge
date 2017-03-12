require 'date'

feature "User can post comments on other peeps" do

  scenario "has a button to add comment" do
    user = User.create(email: 'test@test.com', password: 'test123', password_confirmation: 'test123', name: 'Ex Name', username: 'ename')
    peep = Peep.create(text: 'This will be commented on', created_at: DateTime.now, user_id: user.id)
    sign_in(email: user.email, password: user.password)
    within 'ul#peeps' do
      click_button "#{peep.id}" # Comment button
    end
    fill_in :comment, with: 'Good one'
    click_button 'Submit'
    expect(page).to have_current_path('/peeps')
    within 'ul#peeps' do
      within 'ul#comments' do
        expect(page).to have_content 'Good one'
      end
    end

  end

end
