class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :link_name
      t.string :link_href
      t.string :description
      t.integer :position, default: 0
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
