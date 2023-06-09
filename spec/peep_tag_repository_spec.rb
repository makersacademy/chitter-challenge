require_relative '../lib/repositories/peep_tag_repository'
require_relative 'database_helper'

RSpec.describe PeepTagRepository do
  before(:each) do
    reset_chitter_table
  end

  context '.create' do
    it 'creates a new peep tag link in the database' do
      peep_id = 1
      tag_id = 1

      expect(DatabaseConnection).to receive(:exec_params)
        .with('INSERT INTO peep_tags (peep_id, tag_id) VALUES ($1, $2);', [peep_id, tag_id])

      PeepTagRepository.create(peep_id, tag_id)
    end
  end

  context '.find_by_peep' do
    it 'returns an array of tags linked to the specified peep' do
      peep_id = 1
      query_result = [{ 'peep_id' => 1, 'tag_id' => 1, 'name' => 'Tag1' }, { 'peep_id' => 1, 'tag_id' => 2, 'name' => 'Tag2' }]

      expect(DatabaseConnection).to receive(:exec_params)
        .with("SELECT pt.peep_id, pt.tag_id, t.name\nFROM peep_tags pt\nJOIN tags t ON pt.tag_id = t.id\nWHERE pt.peep_id = $1;\n", [peep_id])
        .and_return(query_result)

      result = PeepTagRepository.find_by_peep(peep_id)

      expect(result).to be_an(Array)
      expect(result.length).to eq(2)
      expect(result[0]).to be_a(PeepTag)
      expect(result[0].peep_id).to eq(1)
      expect(result[0].tag_id).to eq(1)
      expect(result[1]).to be_a(PeepTag)
      expect(result[1].peep_id).to eq(1)
      expect(result[1].tag_id).to eq(2)
    end

    it 'returns an empty array if no tags are linked to the specified peep' do
      peep_id = 5

      expect(DatabaseConnection).to receive(:exec_params)
        .with("SELECT pt.peep_id, pt.tag_id, t.name\nFROM peep_tags pt\nJOIN tags t ON pt.tag_id = t.id\nWHERE pt.peep_id = $1;\n", [peep_id])
        .and_return([])

      result = PeepTagRepository.find_by_peep(peep_id)

      expect(result).to be_an(Array)
      expect(result).to be_empty
    end
  end

  context '.find_by_tag' do
    it 'returns an array of peeps linked to the specified tag' do
      tag_id = 1
      query_result = [{ 'peep_id' => 1, 'tag_id' => 1, 'name' => 'Tag1' }, { 'peep_id' => 2, 'tag_id' => 1, 'name' => 'Tag1' }]

      expect(DatabaseConnection).to receive(:exec_params)
        .with("SELECT pt.peep_id, pt.tag_id, t.name\nFROM peep_tags pt\nJOIN tags t ON pt.tag_id = t.id\nWHERE pt.tag_id = $1;\n", [tag_id])
        .and_return(query_result)

      result = PeepTagRepository.find_by_tag(tag_id)

      expect(result).to be_an(Array)
      expect(result.length).to eq(2)
      expect(result[0]).to be_a(PeepTag)
      expect(result[0].peep_id).to eq(1)
      expect(result[0].tag_id).to eq(1)
      expect(result[1]).to be_a(PeepTag)
      expect(result[1].peep_id).to eq(2)
      expect(result[1].tag_id).to eq(1)
    end

    it 'returns an empty array if no peeps are linked to the specified tag' do
      tag_id = 5

      expect(DatabaseConnection).to receive(:exec_params)
        .with("SELECT pt.peep_id, pt.tag_id, t.name\nFROM peep_tags pt\nJOIN tags t ON pt.tag_id = t.id\nWHERE pt.tag_id = $1;\n", [tag_id])
        .and_return([])

      result = PeepTagRepository.find_by_tag(tag_id)

      expect(result).to be_an(Array)
      expect(result).to be_empty
    end
  end

  context '.delete' do
    it 'deletes the peep tag link from the database' do
      peep_id = 1
      tag_id = 1

      expect(DatabaseConnection).to receive(:exec_params)
        .with('DELETE FROM peep_tags WHERE peep_id = $1 AND tag_id = $2;', [peep_id, tag_id])

      PeepTagRepository.delete(peep_id, tag_id)
    end
  end
end