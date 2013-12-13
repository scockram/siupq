class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.boolean :status
      t.timestamps
    end
  end
end
