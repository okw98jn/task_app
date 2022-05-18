class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :is_all_day
      t.text :memo_text

      t.timestamps
    end
  end
end
