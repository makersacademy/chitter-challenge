feature 'User sign up' do

  scenario "user should find and fill out a signup form" do
      visit '/sign_up'
      fill_in :email, with: "john.franco@franco.com"
      fill_in :name, with: "John Franco"
      fill_in :user_name, with: "John"
      fill_in :password, with: "John"
      click_button "submit"
    end



end
