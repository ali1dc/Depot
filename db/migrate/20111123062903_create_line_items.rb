class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.references :product
      t.references :cart

      t.timestamps
    end
  end

  def self.down
    drop_table :line_items
  end
end
