require './spec/factories/user'
require './spec/factories/peep'

feature 'creating peep' do
  scenario 'can only create peep when logged in' do
    visit '/peep/new'
    expect(page).to have_content 'Please log in to create peep.'
  end

  scenario 'can create a new peep' do
    user = create :user
    log_in user, user.password
    peep = build :peep
    create_peep peep
    expect(current_path).to eq('/peep/all')
    expect(page).to have_content peep.content
  end
end
