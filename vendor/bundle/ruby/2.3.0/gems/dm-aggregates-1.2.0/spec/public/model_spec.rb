require 'spec_helper'

describe DataMapper::Model do
  supported_by :sqlite, :mysql, :postgres do
    let(:dragons)   { Dragon  }
    let(:countries) { Country }

    it_should_behave_like 'It Has Setup Resources'
    it_should_behave_like 'An Aggregatable Class'
  end
end
