# As a Maker
# So that I can stay constantly tapped in to the shouty box of Chitter
# I want to receive an email if I am tagged in a Peep

feature 'users receive emails if tagged in a peep' do

  scenario 'it can send an email' do
    create_user
    create_second_user
    valid_login
    post_message_tag_second_user
    expect(page).to have_content '@pj has been tagged and emailed'
  end

end
