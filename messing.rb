#temporary file to prove idea worked.
class Peep

def peep(peep)
  "Peep: #{peep} Time: #{time()}"
end

def time
  Time.now
end

let(:time_peep) { Peep.new }
it "displays a list of the peeps" do

peeps = Peep.all
allow(time_peep).to receive(:peep_time).and_return("2020-04-11 14:12:12 +0100")


end
