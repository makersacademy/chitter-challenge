class Tags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.column :content, :string
    end

    execute <<-SQL

    ALTER TABLE tags
    RENAME id TO tag_id;

    ALTER TABLE tags
    ADD CONSTRAINT fk_tag_id
    FOREIGN KEY (tag_id)
    REFERENCES users(id);
    SQL
  end
end
