require_relative '../factories/user.rb'

feature 'User post message' do

  scenario 'user can post a message to chitter' do
    user = create :user
    sign_in(user)
    post_peep('Peep test')
    expect(page).to have_content('Peep test')

  end
end
