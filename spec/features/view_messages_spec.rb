require 'pg'

feature 'View messages' do
  scenario 'Can view all the messages (peeps) on Chitter' do
    register_for_chitter
    PeepMessage.create("Maurice, it has been too long", "Sarah Miles", "smiles", Time.now)
    PeepMessage.create("Sarah! I missed you", "Maurice Bendrix", "mauribendrix", Time.now)
    PeepMessage.create("Henry is well...", "Sarah Miles", "smiles", Time.now)
    visit('/peeps')
    expect(page).to have_content "Maurice, it has been too long"
    expect(page).to have_content "Sarah! I missed you"
    expect(page).to have_content "Henry is well..."
  end

  scenario 'Can view all the messages (peeps) on Chitter in reverse order' do
    register_for_chitter
    first_peep = PeepMessage.create("Maurice, it has been too long", "Sarah Miles", "smiles", Time.now)
    second_peep = PeepMessage.create("Sarah! I missed you", "Maurice Bendrix", "mauribendrix", Time.now)
    third_peep = PeepMessage.create("Henry is well...", "Sarah Miles", "smiles", Time.now)
    visit('/peeps')
    expect(page.body.index(second_peep.message)).to be < page.body.index(first_peep.message)
    expect(page.body.index(third_peep.message)).to be < page.body.index(second_peep.message)
  end
end
