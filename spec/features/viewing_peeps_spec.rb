feature 'Viewing peeps' do

  let!(:user) do
    User.create(name: 'Jack Bauer',
                user_name: 'Jack24',
                email: 'jbauer@ctu.com',
                password: 'damn_it!',
                password_confirmation: 'damn_it!')
  end

  scenario 'I can see existing peeps on the peeps page' do
    sign_in(user_name: user.user_name,   password: user.password)
    visit '/peeps/new'
    fill_in 'peep_text', with: 'Hello World!'
    click_button 'Peep it!'

    expect(current_path).to eq('/peeps')

    within 'ul#peeps' do
      expect(page).to have_content('Hello World!')
    end
  end

  scenario 'I can see the time a peep was created' do
    sign_in(user_name: user.user_name,   password: user.password)
    Timecop.freeze do
      visit '/peeps/new'
      fill_in 'peep_text', with: 'Hello World!'
      click_button 'Peep it!'

      expect(current_path).to eq('/peeps')

      within 'ul#peeps' do
        time = Time.now
        t = "#{time.strftime("%R")} on #{time.strftime("%d/%-m")}"
        expect(page).to have_content(t)
      end
    end
  end
end
