require_relative '../lib/repositories/tag_repository'
require_relative 'database_helper'

RSpec.describe TagRepository do
  before(:each) do
    reset_chitter_table
  end

  context '.create' do
    it 'creates a new tag in the database' do
      name = 'Test Tag'

      expect(DatabaseConnection).to receive(:exec_params)
        .with('INSERT INTO tags (name) VALUES ($1) RETURNING id;', [name])

      result = TagRepository.create(name)

      expect(result).to be_nil
    end
  end

  context '.find' do
    it 'returns the tag with the given id' do
      tag_id = 1
      query_result = [{ 'id' => 1, 'name' => 'Test Tag' }]

      expect(DatabaseConnection).to receive(:exec_params)
        .with('SELECT id, name FROM tags WHERE id = $1;', [tag_id])
        .and_return(query_result)

      result = TagRepository.find(tag_id)

      expect(result).to be_a(Tag)
      expect(result.id).to eq(1)
      expect(result.name).to eq('Test Tag')
    end

    it 'returns nil if no tag found with the given id' do
      tag_id = 5

      expect(DatabaseConnection).to receive(:exec_params)
        .with('SELECT id, name FROM tags WHERE id = $1;', [tag_id])
        .and_return([])

      result = TagRepository.find(tag_id)

      expect(result).to be_nil
    end
  end

  context '.all' do
    it 'returns all tags from the database' do
      query_result = [
        { 'id' => 1, 'name' => 'Tag 1' },
        { 'id' => 2, 'name' => 'Tag 2' },
        { 'id' => 3, 'name' => 'Tag 3' }
      ]

      expect(DatabaseConnection).to receive(:exec_params)
        .with('SELECT id, name FROM tags;', [])
        .and_return(query_result)

      result = TagRepository.all

      expect(result).to be_an(Array)
      expect(result.size).to eq(3)

      expect(result[0]).to be_a(Tag)
      expect(result[0].id).to eq(1)
      expect(result[0].name).to eq('Tag 1')

      expect(result[1]).to be_a(Tag)
      expect(result[1].id).to eq(2)
      expect(result[1].name).to eq('Tag 2')

      expect(result[2]).to be_a(Tag)
      expect(result[2].id).to eq(3)
      expect(result[2].name).to eq('Tag 3')
    end

    it 'returns an empty array if no tags found in the database' do
      expect(DatabaseConnection).to receive(:exec_params)
        .with('SELECT id, name FROM tags;', [])
        .and_return([])

      result = TagRepository.all

      expect(result).to be_an(Array)
      expect(result).to be_empty
    end
  end

  context '.update' do
    it 'updates the name of the specified tag' do
      tag_id = 1
      updated_name = 'Updated Tag'

      expect(DatabaseConnection).to receive(:exec_params)
        .with('UPDATE tags SET name = $1 WHERE id = $2;', [updated_name, tag_id])

      TagRepository.update(updated_name, tag_id)
    end
  end

  context '.delete' do
    it 'deletes the specified tag' do
      tag_id = 1

      expect(DatabaseConnection).to receive(:exec_params)
        .with('DELETE FROM tags WHERE id = $1;', [tag_id])

      TagRepository.delete(tag_id)
    end
  end

end
