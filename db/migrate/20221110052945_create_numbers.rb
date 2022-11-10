class CreateNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :numbers do |t|
      t.bigint :phone_number
      t.text :comment
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
