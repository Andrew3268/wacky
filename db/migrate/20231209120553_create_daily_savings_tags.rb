class CreateDailySavingsTags < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_savings_tags, :id => false do |t|
      t.references :daily_saving, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
