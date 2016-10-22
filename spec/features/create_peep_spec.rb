require_relative 'web_helpers'

feature 'create a peep' do
  it 'creates a peep object and stores it to the database' do
    register
    visit ("/peeps/peepdeck")
    fill_in "peep", with: "My first peep"
    expect{ click_button "PEEP" }.to change{ Peep.all.count }.by(1)
  end

end
