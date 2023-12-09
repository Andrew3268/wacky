class CreateDailySavings < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_savings do |t|
      t.integer :user_id
      t.string :ds_title
      t.string :ds_image
      t.string :ds_hashtag
      t.decimal :ds_price
      t.decimal :ds_was_price
      t.decimal :ds_pct
      t.decimal :ds_ratings
      t.integer :ds_rating_code
      t.integer :ds_reviews

      t.timestamps
    end
  end
end
