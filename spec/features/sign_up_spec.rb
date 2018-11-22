require_relative 'web_helpers.rb'

feature "signing up for chitter" do
  before(:each) do
    prepare_databases
    visit('/')
  end
  scenario("When I sign up my name is displayed instead of a invitation to register") do
    sign_up
    expect(page).to have_content("Welcome to chitter madeUpUser")
  end
end
