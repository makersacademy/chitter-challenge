feature 'Viewing peeps' do
  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(message: 'Makers Academy')

    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content "Makers Academy"
    end
  end
end

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
#
# I can only peep if I am logged in

feature 'Add peeps' do
  let(:user) do
    User.create(SessionHelpers::PARAMS_CORRECT)
  end

  scenario 'if not logged in can\'t add peeps' do
    visit '/peeps/new'
    expect(page).to have_content "Please sign in"
  end

  scenario 'I can add peeps to chitter when logged in' do
    sign_in_and_peep
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Google"

  end

  scenario 'peeps contain name, username, and timestamp' do
    sign_in_and_peep
    expect(page).to have_content(user.name)
    # expect(page).to have_content(user.username)

  end


end
