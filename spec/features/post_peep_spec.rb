require_relative '../web_helpers'

feature 'peeps' do
  scenario 'Signed in user can post a peep' do
    sign_up
    post_peep(message: "My first peep")
    expect(page).to have_content "My first peep"
  end
  scenario 'User can see the time a peep was created' do
    sign_up
    time = Time.new
    post_peep(message: "My first peep")
    expect(page).to have_content time
  end
end
