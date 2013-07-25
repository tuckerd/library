class CreateInvolvements < ActiveRecord::Migration
  def change
    create_table :involvements do |t|
      t.string :role
      t.references :person
      t.references :movie

      t.timestamps
    end
    add_index :involvements, :person_id
    add_index :involvements, :movie_id
  end
end
