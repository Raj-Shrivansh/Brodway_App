class CreatePlays < ActiveRecord::Migration[7.1]
  def change
    create_table :plays do |t|
      t.string :title
      t.text :desc
      t.string :director

      t.timestamps
    end
  end
end
