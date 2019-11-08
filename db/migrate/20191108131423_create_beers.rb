class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :style
      t.integer :min_temperature
      t.integer :max_temperature

      t.timestamps
    end
  end
end
