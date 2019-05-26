def set_time(time)
  allow(Time).to receive(:now).and_return(time)
end
