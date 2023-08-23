class CreateAirfryers < ActiveRecord::Migration[7.0]
  def change
    create_table :airfryers do |t|
      t.integer :user_id
      t.string :af_title
      t.string :af_image
      t.string :af_hashtag
      t.string :af_price
      t.string :af_type
      t.string :af_volume
      t.string :af_material
      t.decimal :af_power
      t.string :af_control
      t.string :af_temp
      t.string :af_timer
      t.string :af_automenu
      t.string :af_rotisserie
      t.string :af_steam
      t.string :af_doubleheating
      t.string :af_dry
      t.string :af_weight
      t.string :af_size
      t.text :af_components
      t.text :af_function
      
      t.timestamps
    end
  end
end
