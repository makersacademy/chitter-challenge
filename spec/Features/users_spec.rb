require "spec_helper"

feature "User sign up" do
	scenario "I can sign up as a new user" do
		visit "/"
		click_button "sign up"
		expect(page.status_code).to eq 200
		fill_in :email, with: "eleni_s_2015@hotmail.com"
		fill_in :password, with: "Passw0rd"
		fill_in :name, with: "Eleni Skouroupathi"
		fill_in :user_name, with: "Dubai_Girl_15"
	click_button "create user"
end
end