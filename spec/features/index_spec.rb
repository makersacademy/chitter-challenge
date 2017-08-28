require_relative "../../app/app"
require 'spec_helper'

RSpec.feature "Index page" do
	scenario "Check if there is a 'email' field to fill" do
		visit "/"
		fill_in("email", with: "panda@gmail.com")
		expect(page.status_code).to eq 200
		expect(page).to have_field("email")
	end

	scenario "Check if there is a 'password' field to fill" do
		visit "/"
		fill_in("password", with: "bamboo")
		expect(page.status_code).to eq 200
		expect(page).to have_field("password")
	end

	scenario "Check if there is a 'name' field to fill" do
		visit "/"
		fill_in("name", with: "Anilou")
		expect(page.status_code).to eq 200
		expect(page).to have_field("name")
	end

	scenario "Check if there is a 'user' field to fill" do
		visit "/"
		fill_in("username", with: "Panda")
		expect(page.status_code).to eq 200
		expect(page).to have_field("username")
	end
end
