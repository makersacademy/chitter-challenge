def stub_time(time)
  allow(Time).to receive(:now).and_return(time)
end
