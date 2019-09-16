describe Peep do
  it 'initializes a new peep' do
    test_time = Time.now
    test_peep = Peep.new(2, 1, 'Test_user', test_time,  'Test content')
    expect(test_peep.user_id).to eq (1)
    expect(test_peep.user).to eq ('Test_user')
    expect(test_peep.submission_time).to eq (test_time)
    expect(test_peep.content).to eq ('Test content')
  end
  it 'creates a new peep' do
    drop_test_database
    populate_test_database
    test_time = Time.now
    test_peep = Peep.create(1, 'Test_user', test_time, 'Test content')
    expect(test_peep.user_id).to eq (1)
    expect(test_peep.user).to eq ('Test_user')
    # expect(test_peep.submission_time).to eq (test_time)
    expect(test_peep.content).to eq ('Test content')
    r = DBcon.query("SELECT * from peep WHERE peep_id = 5;")
    expect(r.values[0][0].to_i).to eq (5)
    expect(r.values[0][1]).to eq ('Test content')
    # expect(r.values[0][2]).to eq (test_time)
    expect(r.values[0][3].to_i).to eq (1)
  end

  # user_id, user, submission_time, content
  it 'returns all peeps in descending order of submission time' do
    drop_test_database
    populate_test_database
    r = Peep.all
    expect(r[0].peep_id).to eq(4)
    expect(r[0].user).to eq('Volker2')
    expect(r[0].user_id).to eq(2)
    expect(r[3].peep_id).to eq(1)
    expect(r[1].content).to eq('Test3')
  end
  it 'returns the correct user id selected' do
    Peep.user_id_selected(1)
    expect(Peep.user_id_selected(nil)).to eq(1)
  end
  it 'returns the correct user name selected' do
    Peep.user_name_selected('Volker')
    expect(Peep.user_name_selected(nil)).to eq('Volker')
  end
end
