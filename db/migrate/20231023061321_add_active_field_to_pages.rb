class AddActiveFieldToPages < ActiveRecord::Migration[7.1]
  def change
    add_column :pages, :active, :boolean, default: true
  end
end
