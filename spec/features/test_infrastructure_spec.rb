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

    scenario 'Should have field for username' do
      expect(page).to have_field('username')
    end

    scenario 'Should have field for password' do
      expect(page).to have_field('password')
    end

    scenario 'Should have login button to login' do
      expect(page).to have_button('Login')
    end

    scenario 'Filling in login should bring you to timeline page' do
      visit '/sign_up'
      fill_in_sign_up_form_as_second
      visit '/login'
      login_as_Arbik
      expect(page).to have_content('Timeline')
    end

    scenario 'Logging in should greet you the same as signing up' do
      visit '/sign_up'
      fill_in_sign_up_form_as_second
      visit '/login'
      login_as_Arbik
      expect(page).to have_content('Hello Arbik')
    end

    scenario "Logging in with the wrong password won't allow you to login" do
      visit '/sign_up'
      fill_in_sign_up_form_as_second
      visit '/login'
      login_as_Arbik_wong_password
      expect(page).to have_content('Login')
    end

    scenario "Logging in with the wrong username won't allow you to login" do
      visit '/sign_up'
      fill_in_sign_up_form_as_second
      visit '/login'
      login_as_Arbik_wong_username
      expect(page).to have_content('Login')
    end

    scenario "Logging in with wrong username should notify user" do
      visit '/sign_up'
      fill_in_sign_up_form_as_second
      visit '/login'
      login_as_Arbik_wong_username
      expect(page).to have_content('Hmm... It appears your username or password entries are incorrect')
    end

    scenario "Logging in with wrong password should notify user" do
      visit '/sign_up'
      fill_in_sign_up_form_as_second
      visit '/login'
      login_as_Arbik_wong_password
      expect(page).to have_content('Hmm... It appears your username or password entries are incorrect')
    end

  end

  feature '#time_line' do

    before do
      visit '/sign_up'
      fill_in_sign_up_form
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

    scenario "Should show the author's name when submitting a peep" do
      submit_peep
      expect(page).to have_content("TEST")
    end

    scenario "Should show the author's name of a peep that is not the current user's" do
      submit_peep
      visit 'sign_up'
      fill_in_sign_up_form_as_second
      submit_peep
      within 'ul#peeps' do
        expect(page).to have_content('TEST') and have_content('Arbik')
      end
    end

    scenario "Should have button to logout" do
      expect(page).to have_button('Logout')
    end

    scenario "Logout should bring you to Login page" do
      click_button('Logout')
      expect(page).to have_content('Login')
    end

    xscenario "Should have removed current user" do
      click_button('Logout')
      expect(session[:user_id]).to eq nil
      expect(session[:user_username]).to eq nil
      expect(session[:user_username]).to eq nil
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

    scenario 'Should greet user when going to timeline' do
      fill_in_sign_up_form
      expect(page).to have_content('Hello TEST')
    end

    scenario "Should greet only current user" do
      fill_in_sign_up_form
      visit 'sign_up'
      fill_in_sign_up_form_as_second
      expect(page).not_to have_content('TEST')
      expect(page).to have_content('Arbik')
    end

    feature 'PASSWORD ISSUES' do

      feature 'Too short a password' do

        scenario "Cannot sign up if you have too short a password" do
          expect { fill_in_sign_up_with_short_password }.not_to change(User, :count)
        end

        scenario "Should not redirect to timeline upon not having a long enough password" do
          fill_in_sign_up_with_short_password
          expect(page).to have_content('Sign up!')
        end

        scenario "Should let user know the issue" do
          fill_in_sign_up_with_short_password
          expect(page).to have_content('Password must be at least 8 characters long')
        end

      end

      feature 'Wrong confirmation' do

        scenario "Cannot sign up if you have not confirmed password" do
          expect { fill_in_sign_up_without_confirm }.not_to change(User, :count)
        end

        scenario "Should not redirect to timeline upon not confirming password" do
          fill_in_sign_up_without_confirm
          expect(page).to have_content('Sign up!')
        end

        scenario "Should let user know the issue" do
          fill_in_sign_up_without_confirm
          expect(page).to have_content('Password does not match the confirmation ')
        end

      end

    end

    feature 'EMAIL ISSUES' do

      feature 'No email' do

        scenario "Cannot sign up if you have not entered email" do
          expect { fill_in_sign_up_with_no_email }.not_to change(User, :count)
        end

        scenario "Should not redirect to timeline upon not entering email" do
          fill_in_sign_up_with_no_email
          expect(page).to have_content('Sign up!')
        end

        scenario "Should let user know the issue" do
          fill_in_sign_up_with_no_email
          expect(page).to have_content('No email entered')
        end

      end

      feature 'Wrong email format' do

        scenario "Cannot sign up if you have entered incorrect email format" do
          expect { fill_in_sign_up_with_incorrect_email_format }.not_to change(User, :count)
        end

        scenario "Should not redirect to timeline upon incorrect email format" do
          fill_in_sign_up_with_incorrect_email_format
          expect(page).to have_content('Sign up!')
        end

        scenario "Should let user know the issue" do
          fill_in_sign_up_with_incorrect_email_format
          expect(page).to have_content('Wrong email format')
        end

      end

      feature 'Common email' do

        scenario "Cannot sign up if you have common email" do
          fill_in_sign_up_with_common_email1
          visit 'sign_up'
          expect { fill_in_sign_up_with_common_email2 }.not_to change(User, :count)
        end

        scenario "Should not redirect to timeline upon entering a common email" do
          fill_in_sign_up_with_common_email1
          visit 'sign_up'
          fill_in_sign_up_with_common_email2
          expect(page).to have_content('Sign up!')
        end

        scenario "Should let user know the issue" do
          fill_in_sign_up_with_common_email1
          visit 'sign_up'
          fill_in_sign_up_with_common_email2
          expect(page).to have_content('Someone has already used that email')
        end

      end

    end

    feature 'USERNAME ISSUES' do

      feature 'No username' do

        scenario "Cannot sign up if you have not entered username" do
          expect { fill_in_sign_up_without_username }.not_to change(User, :count)
        end

        scenario "Should not redirect to timeline upon not username" do
          fill_in_sign_up_without_username
          expect(page).to have_content('Sign up!')
        end

        scenario "Should let user know the issue" do
          fill_in_sign_up_without_username
          expect(page).to have_content('No username')
        end

      end

      feature 'Common username' do

        scenario "Cannot sign up if you have common username" do
          fill_in_sign_up_with_common_username1
          visit 'sign_up'
          expect { fill_in_sign_up_with_common_username2 }.not_to change(User, :count)
        end

        scenario "Should not redirect to timeline upon entering a common username" do
          fill_in_sign_up_with_common_username1
          visit 'sign_up'
          fill_in_sign_up_with_common_username2
          expect(page).to have_content('Sign up!')
        end

        scenario "Should let user know the issue" do
          fill_in_sign_up_with_common_username1
          visit 'sign_up'
          fill_in_sign_up_with_common_username2
          expect(page).to have_content('Username already taken')
        end

      end

    end

  end

end
