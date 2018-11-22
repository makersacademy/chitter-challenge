require_relative 'web_helpers.rb'

feature "Index page" do
  before(:each) do
    prepare_databases
    visit('/')
  end
  scenario "handle of user is shown" do
    sign_up
    fill_in('peep_content', with: "Hollaaaa test numero two")
    click_button('Post')
    expect(page).to have_content(/@madeUpUser.+\nHollaaaa test numero two/)
  end
end
