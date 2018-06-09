require 'pg'

feature 'View messages' do
  scenario 'Can view all the messages (peeps) on Chitter' do
    PeepMessage.create("Maurice, it has been too long", "Sarah Miles", "Smiles")
    PeepMessage.create("Sarah! I missed you", "Maurice Bendrix", "mauribendrix")
    PeepMessage.create("Henry is well...", "Sarah Miles", "Smiles")
    visit('/peeps')
    expect(page).to have_content "Maurice, it has been too long"
    expect(page).to have_content "Sarah! I missed you"
    expect(page).to have_content "Henry is well..."
  end
end
