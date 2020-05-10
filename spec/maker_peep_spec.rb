require 'maker_peep.rb'
require 'spec_helper'

RSpec.describe MakerPeep do
  describe '.all' do
    context 'it shows a list of peeps' do
      it 'enables user to view list of peeps in chronological order' do
        MakerPeep.create(peep: "I went on a walk", datetime: "08/05/2020", username: "Sally")
        MakerPeep.create(peep: "I went on a walk again", datetime: "09/05/2020", username: "Sally")
        maker = MakerPeep.all
        expect(maker.first.peep).to eq "I went on a walk again"
      end
    end
  end
  describe '.create' do
    context 'it enables us to create new peeps' do
      it 'shows how to create a new peep' do
        maker = MakerPeep.create(peep: "I went on a walk", datetime: "08/05/2020", username: "Sally")
        PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps;")

        expect(maker).to be_a MakerPeep
        expect(maker.peep).to eq "I went on a walk"
      end
    end
  end
end
