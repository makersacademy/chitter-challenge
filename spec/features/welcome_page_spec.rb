require 'helpers'

feature "Homepage peep --" do
  include Helpers

  scenario 'Homepage to display peep' do

    sign_up
    peep_helper
    visit('/')
    expect(page).to have_text('My first peep!')
  end
end
