require "spec_helper"

feature "User sign up" do
	scenario "I can sign up as a new user" do
		visit "/"
		expect { sign_up }.to change(User, :count).by(1)
		expect(User.first.email).to eq("eleni_s_2015@hotmail.com")
end
end