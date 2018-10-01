require_relative "../web_helpers"

feature "Chitter Homepage" do
  feature "News feed" do
    scenario "should display peep" do
      logged_on
      post_a_peep
      visit "/peeps"
      expect(page).to have_content "This is the post_a_peep test peep"
    end

    scenario "should display peepers name and handle" do
      logged_on
      post_a_peep
      visit "/peeps"
      expect(page).to have_content "AbagnaleF"
      expect(page).to have_content "Frank Abagnale"
    end

    scenario "should display multiple peeps" do
      logged_on
      post_a_peep
      post_a_peep2
      visit "/peeps"
      expect(first('.peep')).to have_content "This is the post_a_peep2 test peep"
    end

    scenario "should display peeps in reverse chronological order" do
      logged_on
      post_a_peep
      post_a_peep2
      visit "/peeps"
      expect(first('.peep-time')).to have_content(Time.now.strftime("%d/%m/%Y at %I:%M%p"))
    end
  end

  feature "if Signed in" do
    feature "Peep button" do
      scenario "takes you to new peep form" do
        logged_on
        visit "/peeps"
        expect(page).not_to have_content("Sign Up")
        expect(page).not_to have_content("Sign In")
        click_button "New Peep"
        expect(current_path).to eq "/peeps/new"
      end
    end

    feature "Sign out button" do
      scenario "logs out" do
        logged_on
        visit "/peeps"
        expect(page).not_to have_content("Sign Up")
        expect(page).not_to have_content("Sign In")
        click_button "Sign Out"
        expect(page).to have_content("Sign Up")
        expect(page).to have_content("Sign In")
      end
    end
  end

  feature "if not Signed in" do
    feature "Sign Up button" do
      scenario "takes you to sign up page" do
        visit "/peeps"
        expect(page).not_to have_content("New Peep")
        click_button "Sign Up"
        expect(current_path).to eq "/users/new"
      end
    end

    feature "Sign In button" do
      scenario "takes you to sign in page" do
        visit "/peeps"
        expect(page).not_to have_content("New Peep")
        click_button "Sign In"
        expect(current_path).to eq "/users/sign_in"
      end
    end
  end

end
