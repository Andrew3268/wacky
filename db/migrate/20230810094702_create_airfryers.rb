class CreateAirfryers < ActiveRecord::Migration[7.0]
  def change
    create_table :airfryers do |t|
      t.integer :user_id
      t.string :af_title
      t.string :af_image
      t.string :af_hashtag
      t.decimal :af_price
      t.decimal :af_was_price
      t.decimal :af_pct
      t.decimal :af_ratings
      t.integer :af_rating_code
      t.integer :af_reviews
      t.string :af_recommend

      t.string :af_oventype
      t.string :af_baskettype
      t.decimal :af_volume
      t.string :af_material
      t.string :af_stainless
      t.decimal :af_power
      t.string :af_control
      t.string :af_temp
      t.string :af_timer
      t.string :af_cutheating
      t.string :af_automenu
      t.string :af_rotisserie
      t.string :af_steam
      t.string :af_doubleheating
      t.string :af_dry
      t.string :af_weight
      t.string :af_size

      
      
      t.timestamps
    end
  end
end
