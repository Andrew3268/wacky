class CreateAirfryers < ActiveRecord::Migration[7.0]
  def change
    create_table :airfryers do |t|
      t.integer :user_id
      t.string :af_title
      t.string :af_image
      t.string :af_hashtag

      t.timestamps
    end
  end
end
