require 'spec_helper'

describe DataMapper::Collection do
  supported_by :sqlite, :mysql, :postgres do
    let(:dragons)   { Dragon.all  }
    let(:countries) { Country.all }

    it_should_behave_like 'It Has Setup Resources'
    it_should_behave_like 'An Aggregatable Class'

    describe 'ignore invalid query' do
      let(:dragons) { Dragon.all.all(:id => []) }

      [ :size, :count ].each do |method|
        describe "##{method}" do
          subject { dragons.send(method) }

          it { should == 0 }
        end
      end

      describe '#min' do
        subject { dragons.min(:id) }

        it { should be_nil }
      end

      describe '#max' do
        subject { dragons.max(:id) }

        it { should be_nil }
      end

      describe '#avg' do
        subject { dragons.avg(:id) }

        it { should be_nil }
      end

      describe '#sum' do
        subject { dragons.sum(:id) }

        it { should be_nil }
      end

      describe '#aggregate' do
        subject { dragons.aggregate(:id) }

        it { should == [] }
      end
    end

    context 'with collections created with Set operations' do
      let(:collection) { dragons.all(:name => 'George') | dragons.all(:name => 'Puff') }

      describe '#size' do
        subject { collection.size }

        it { should == 2 }
      end

      describe '#count' do
        subject { collection.count }

        it { should == 2 }
      end

      describe '#min' do
        subject { collection.min(:toes_on_claw) }

        it { should == 3 }
      end

      describe '#max' do
        subject { collection.max(:toes_on_claw) }

        it { should == 4 }
      end

      describe '#avg' do
        subject { collection.avg(:toes_on_claw) }

        it { should == 3.5 }
      end

      describe '#sum' do
        subject { collection.sum(:toes_on_claw) }

        it { should == 7 }
      end

      describe '#aggregate' do
        subject { collection.aggregate(:all.count, :name.count, :toes_on_claw.min, :toes_on_claw.max, :toes_on_claw.avg, :toes_on_claw.sum)}

        it { should == [ 2, 2, 3, 4, 3.5, 7 ] }
      end
    end

    context 'with a collection limited to 1 result' do
      let(:dragons) { Dragon.all(:limit => 1) }

      describe '#size' do
        subject { dragons.size }

        it { should == 1 }
      end

      describe '#count' do
        subject { dragons.count }

        it { pending('TODO: make count apply to the limited collection. Currently limit applies after the count') { should == 1 } }
      end
    end

    context 'with the order reversed by the grouping field' do
      subject { dragons.aggregate(:birth_at, :all.count) }

      let(:dragons) { Dragon.all(:order => [ :birth_at.desc ]) }

      it 'displays the results in reverse order' do
        should == Dragon.aggregate(:birth_at, :all.count).reverse
      end
    end
  end
end
