class CreateLineItem < ActiveRecord::Migration
  def self.up
    create_table :line_items , id: false do |t|
      t.references :product
      t.references :cart
    end
  end

  def self.down
    drop_table :line_items
  end
end
