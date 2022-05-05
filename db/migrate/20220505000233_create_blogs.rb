class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :slug
      t.string :description
      t.text :article

      t.timestamps
    end
  end
end
