class CreateSections < ActiveRecord::Migration[7.1]
  def change
    create_table :sections do |t|
      t.string :title
      t.integer :position, default: 0
      t.references :page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
