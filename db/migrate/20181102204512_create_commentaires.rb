class CreateCommentaires < ActiveRecord::Migration[5.2]
  def change
    create_table :commentaires do |t|
      t.string :auteur
      t.text :body
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
