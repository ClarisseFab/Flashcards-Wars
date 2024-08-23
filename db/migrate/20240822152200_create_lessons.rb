class CreateLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.text :content
      t.references :subcategory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
