class CreateGoldenMenus < ActiveRecord::Migration
  def change
    create_table :golden_menus do |t|
      t.string :url
      t.string :group
      t.string :name, null: false
      t.string :description
      t.string :resource_url
      t.references :parent
      t.integer :lft
      t.integer :rgt
      t.integer :depth

      t.timestamps
    end
    add_index :golden_menus, :url
    add_index :golden_menus, :parent_id
  end
end
