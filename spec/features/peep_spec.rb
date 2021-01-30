require_relative './web_helpers.rb'

# feature 'view a peep' do
#   scenario 'a user can see all the peeps' do
#     sign_up_and_log_in
#
#
#   end
# end

feature 'create a peep' do
  scenario 'a user can create a peep' do
    sign_up_and_log_in

    expect(current_path).to eq '/chitter'
    fill_in("text", with: "It is my first peep")
    click_button("Peep")

    expect(page).to have_content("It is my first peep")
  end
end
