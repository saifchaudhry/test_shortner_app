class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.text :actual_url
      t.string :shortened_url
      t.integer :views, default: 0
      t.string :title
      t.timestamps
    end
  end
end
