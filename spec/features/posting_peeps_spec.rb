# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'Posting peeps' do
  let(:user) do
    User.create(name: 'Michael H',
                email: 'test@chitter.com',
                handle: 'mikeh91',
                password: 'password',
                password_confirmation: 'password')
  end
  let(:user2) do
    User.create(name: 'test name',
                email: 'test2@chitter.com',
                handle: 'test',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'logged in user can post peeps' do
    sign_in(email: user.email, password: user.password)
    fill_in(:peep_text, with: 'Hello world')

    expect{ click_button('Post peep') }.to change(Peep, :count).by 1
    expect(current_path).to eq '/users/mikeh91'

    within 'div#peeps' do
      within 'div.peep' do
        within 'div.name' do
          expect(page).to have_content('Michael H')
        end
        within 'div.handle' do
          expect(page).to have_content('mikeh91')
        end
        within 'div.timestamp' do
          expect(page).to have_content(Time.now.strftime("%d %b '%y - %H:%M"))
        end
        within 'div.message' do
          expect(page).to have_content('Hello world')
        end
      end
    end
  end

  scenario 'cannot post peeps while logged out' do
    User.create(name: 'Michael H',
                email: 'test@chitter.com',
                handle: 'mikeh91',
                password: 'password',
                password_confirmation: 'password')
    visit '/users/mikeh91'
    expect(page).not_to have_selector("input[type=submit][value='Post peep']")
  end

  scenario 'peeps are only shown on the poster\'s profile' do
    User.create(name: 'test name',
                email: 'test2@chitter.com',
                handle: 'test',
                password: 'password',
                password_confirmation: 'password')
    sign_in(email: user.email, password: user.password)
    fill_in(:peep_text, with: 'Hello world')
    click_button('Post peep')
    visit '/users/test'
    within 'div#peeps' do
      expect(page).not_to have_content('Hello world')
    end
  end

  scenario 'peeps are listed in reverse chronological order' do
    sign_in(email: user.email, password: user.password)
    fill_in(:peep_text, with: 'First')
    click_button('Post peep')
    fill_in(:peep_text, with: 'Second')
    click_button('Post peep')

    within first('.peep') do
      expect(page).to have_content('Second')
      expect(page).not_to have_content('First')
    end
  end

end