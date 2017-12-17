require_relative '../../app.rb'

feature "testing infrastructure" do

  feature '#logging in page' do

    before do
      visit '/login'
    end

    scenario 'Should have a title' do
      expect(page).to have_content('Chitter™')
    end

    scenario 'Page should have a link for those that have not signed up' do
      expect(page).to have_link('sign up!')
    end

    scenario 'sign up! Link should take you to sign up page' do
      click_link('sign up!')
      expect(page).to have_content('Sign up!')
    end

  end

  feature '#time_line' do

    before do
      visit '/time_line'
    end

    scenario 'Should have a field for entering your peep' do
      expect(page).to have_field('peep')
    end

    scenario 'Should have a submit button to feed peep to time line' do
      expect(page).to have_button('peep')
    end

    scenario 'Should be able to submit peep to page' do
      submit_peep
      expect(page).to have_content('testing')
    end

    scenario 'Should display all peeps in chronological order' do
      submit_peep
      submit_peep_2
      expect(page.find('li:nth-child(2)')).to have_content('testing')
      expect(page.find('li:nth-child(1)')).to have_content('t3sting2')
    end

    scenario 'Should be able to show the date and time of when a peep was made' do
      timenow = double(:timenow, strftime: 'fixedtime')
      allow(Time).to receive(:now).and_return(timenow)
      submit_peep
      expect(page).to have_content("fixedtime")
    end

  end

  feature '#Signing Up!' do

    before do
      visit '/sign_up'
    end

    scenario 'page should have a signup! message' do
      expect(page).to have_content('Sign up!')
    end

    scenario 'page should have a field for user name, email, password & confirm password' do
      expect(page).to have_field('user_name') and have_field('email') and have_field('password') and have_field('confirm_password')
    end

    scenario 'page should have a submit button to sign up!' do
      expect(page).to have_button('Sign up!')
    end

    scenario 'pressing button should take you to the timeline' do
      fill_in_sign_up_form
      expect(page).to have_content('Timeline')
    end

  end

end
