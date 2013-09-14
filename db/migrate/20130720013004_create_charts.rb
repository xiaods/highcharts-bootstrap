class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.string :name

      t.timestamps
    end
  end
end
