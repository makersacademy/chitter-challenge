require 'peep'

describe Peep do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :peep_text }
  xit { is_expected.to validate_presence_of :peep_text }
end