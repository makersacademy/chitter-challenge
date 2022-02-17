feature 'view_all_peeps' do
  scenario 'be able to see all peeps' do
    Peeps.create(peep: 'Test peep 1')
    Peeps.create(peep: 'Test peep 2')
    peeps = Peeps.all
    expect(peeps).to include 'Test peep 1'
    expect(peeps).to include 'Test peep 2'
  end
end