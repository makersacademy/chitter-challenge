# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Adding Peep' do
  scenario 'a user can add a peep' do
    register_user
    # p session[:user_id]
    # p current_path
    create_single_peep
    # p current_path
    # p URI.parse(current_url)
    expect(page).to have_content('peeper1234 wrote a Peep: Woohoo, I am peeping')
  end
end
