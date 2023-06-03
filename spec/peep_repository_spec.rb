require_relative '../lib/repositories/peep_repository'
require_relative 'database_helper'

RSpec.describe PeepRepository do
  before(:each) do 
    reset_chitter_table
  end

  context '.create' do
    it 'creates a new peep in the database' do
      content = 'This is a test peep'
      timestamp = '2023-06-01 12:34:56'
      user_id = 1

      expect(DatabaseConnection).to receive(:exec_params)
        .with(
          'INSERT INTO peeps (content, timestamp, user_id) VALUES ($1, $2, $3);',
          [content, timestamp, user_id]
        )

      PeepRepository.create(content, timestamp, user_id)
    end
  end

  context '.find' do
    it 'returns the peep with the given id' do
      peep_id = 1
      query_result = [{ 'id' => 1, 'content' => 'Test Peep', 'timestamp' => '2023-06-01 12:34:56', 'user_id' => 1 }]

      expect(DatabaseConnection).to receive(:exec_params)
        .with('SELECT id, content, timestamp, user_id FROM peeps WHERE id = $1;', [peep_id])
        .and_return(query_result)

      result = PeepRepository.find(peep_id)

      expect(result).to be_a(Peep)
      expect(result.id).to eq(1)
      expect(result.content).to eq('Test Peep')
      expect(result.timestamp).to eq('2023-06-01 12:34:56')
      expect(result.user_id).to eq(1)
    end

    it 'returns nil if no peep found with the given id' do
      peep_id = 5

      expect(DatabaseConnection).to receive(:exec_params)
        .with('SELECT id, content, timestamp, user_id FROM peeps WHERE id = $1;', [peep_id])
        .and_return([])

      result = PeepRepository.find(peep_id)

      expect(result).to be_nil
    end
  end

  context '.all' do
    it 'returns all peeps in the database' do
      query_result = [
        { 'id' => 1, 'content' => 'Peep 1', 'timestamp' => '2023-06-01 12:34:56', 'user_id' => 1 },
        { 'id' => 2, 'content' => 'Peep 2', 'timestamp' => '2023-06-01 12:35:00', 'user_id' => 2 }
      ]

      expect(DatabaseConnection).to receive(:exec_params)
        .with('SELECT id, content, timestamp, user_id FROM peeps;', [])
        .and_return(query_result)

      results = PeepRepository.all

      expect(results.length).to eq(2)

      expect(results[0]).to be_a(Peep)
      expect(results[0].id).to eq(1)
      expect(results[0].content).to eq('Peep 1')
      expect(results[0].timestamp).to eq('2023-06-01 12:34:56')
      expect(results[0].user_id).to eq(1)

      expect(results[1]).to be_a(Peep)
      expect(results[1].id).to eq(2)
      expect(results[1].content).to eq('Peep 2')
      expect(results[1].timestamp).to eq('2023-06-01 12:35:00')
      expect(results[1].user_id).to eq(2)
    end

    it 'returns an empty array if no peeps found' do
      expect(DatabaseConnection).to receive(:exec_params)
        .with('SELECT id, content, timestamp, user_id FROM peeps;', [])
        .and_return([])

      results = PeepRepository.all

      expect(results).to eq([])
    end
  end

  context '.sort_by_timestamp' do
    it 'sorts peeps by timestamp in ascending order' do
      peep1 = Peep.new
      peep1.timestamp = '2023-06-01 12:35:00'

      peep2 = Peep.new
      peep2.timestamp = '2023-06-01 12:34:56'

      peep3 = Peep.new
      peep3.timestamp = '2023-06-01 12:36:00'

      peeps = [peep1, peep2, peep3]

      sorted_peeps = PeepRepository.sort_by_timestamp(peeps)

      expect(sorted_peeps).to eq([peep2, peep1, peep3])
    end
  end

  context '.find_by_user' do
    it 'returns peeps belonging to the specified user' do

      # Create some sample peeps belonging to user 1
      user_3 = UserRepository.create('John Doe', 'johndoe', 'johndoe@example.com', 'password123')
      peep1 = PeepRepository.create('Peep 1', '2023-06-01 12:00:00', 3)
      peep2 = PeepRepository.create('Peep 2', '2023-06-01 13:00:00', 3)
      peep3 = PeepRepository.create('Peep 3', '2023-06-01 14:00:00', 2)
      
      # Retrieve peeps for user 1
      result = PeepRepository.find_by_user(3)
      # Verify if only peeps belonging to user 1 are returned
      expect(result).to be_an(Array)
      expect(result.length).to eq(2)
      expect(result[0].content).to eq('Peep 1')
      expect(result[1].content).to eq('Peep 2')
      expect(result).not_to include(peep3)
    end
  end

  context '.find_by_tag' do
    xit 'returns peeps associated with the specified tag' do
      tag = 'ruby'

      # Create some sample peeps associated with the 'ruby' tag
      peep1 = PeepRepository.create('Peep 1', '2023-06-01 12:00:00', 1)
      peep2 = PeepRepository.create('Peep 2', '2023-06-01 13:00:00', 1)
      peep3 = PeepRepository.create('Peep 3', '2023-06-01 14:00:00', 2)

      # Associate peeps with the 'ruby' tag
      TagRepository.create(peep1.id, tag)
      TagRepository.create(peep2.id, tag)

      # Retrieve peeps associated with the 'ruby' tag
      result = PeepRepository.find_by_tag(tag)

      # Verify if only peeps associated with the 'ruby' tag are returned
      expect(result).to be_an(Array)
      expect(result.length).to eq(2)
      expect(result).to include(peep1, peep2)
      expect(result).not_to include(peep3)
    end
  end

  context '.update' do
    it 'updates the content of the specified peep' do
      peep = Peep.new
      peep.content = 'Original content'
      peep.timestamp = '2023-06-01 12:00:00'
      peep.user_id = 1

      PeepRepository.create(peep.content, peep.timestamp, peep.user_id)
      updated_content = 'Updated content'


      # Update the content of the peep
      PeepRepository.update(updated_content, PeepRepository.all.last.id)

      # Retrieve the updated peep
      updated_peep = PeepRepository.find(PeepRepository.all.last.id)

      # Verify if the peep's content is updated
      expect(updated_peep.content).to eq(updated_content)
    end
  end

  context '.delete' do
    it 'deletes the specified peep' do
      peep = PeepRepository.create('Peep to delete', '2023-06-01 12:00:00', 1)

      # Delete the peep
      PeepRepository.delete(PeepRepository.all.last.id)

      # Try to find the deleted peep
      deleted_peep = PeepRepository.find(PeepRepository.all.last.id)

      # Verify if the deleted peep is nil
      expect(deleted_peep.content).not_to eq('Peep to delete')
    end
  end
end