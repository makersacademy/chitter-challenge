require 'pg'

feature 'View context of messages' do
  scenario 'Can view the time that a message (peeps) was made on Chitter' do
    register_for_chitter
    peep_1 = PeepMessage.create("Maurice, it has been too long", "Sarah Miles", "smiles", Time.now)
    peep_2 = PeepMessage.create("Sarah! I missed you", "Maurice Bendrix", "mauribendrix", Time.now)
    peep_3 = PeepMessage.create("Henry is well...", "Sarah Miles", "smiles", Time.now)
    visit('/peeps')
    expect(page).to have_content peep_1.time
    expect(page).to have_content peep_2.time
    expect(page).to have_content peep_3.time
  end
end
