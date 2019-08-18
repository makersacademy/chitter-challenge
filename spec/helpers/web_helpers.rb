DB = connect('chitter_test')

def add_peeps(*peeps)
  peeps.each do |peep|
    DB.exec(
      "INSERT INTO peeps(text) VALUES ('#{peep}');"
    )
  end
end

