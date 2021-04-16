class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :Name
      t.text :Description
      t.decimal :Price

      t.timestamps
    end
  end
end
