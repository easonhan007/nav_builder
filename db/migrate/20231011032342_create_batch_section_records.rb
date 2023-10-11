class CreateBatchSectionRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :batch_section_records do |t|
      t.references :page, null: false, foreign_key: true
      t.text :content
      t.text :log

      t.timestamps
    end
  end
end
