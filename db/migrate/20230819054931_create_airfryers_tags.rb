class CreateAirfryersTags < ActiveRecord::Migration[7.0]
  def change
    create_table :airfryers_tags, :id => false do |t|
      t.references :airfryer, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps
    end
  end
end




