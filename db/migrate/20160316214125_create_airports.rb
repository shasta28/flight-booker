class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :code, null: false

      t.timestamps null: false
    end
  end
end
