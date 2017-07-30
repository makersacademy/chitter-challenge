feature 'Creating peeps' do

  scenario 'new peeps can be created form the page' do
    create_peep
    create_peep(name: 'Lucia',
                copy: 'Hello Barney')

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      peep = Peep.last
      p peep
      expect(peep.name).to include 'Lucia'
      expect(peep.name).not_to include 'Barney'
    end
  end

end
