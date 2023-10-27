class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.string            :post_code,                 null: false
      t.integer           :region_id,                 null: false
      t.string            :municipality,              null: false
      t.string            :street_address,            null: false
      t.string            :building_name
      t.string            :phone,                     null: false
      t.references        :buy,                       null: false,   foreign_key: true
      t.timestamps
    end
  end
end
