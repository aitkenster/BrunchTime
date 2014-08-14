class CreateLuvits < ActiveRecord::Migration
  def change
    create_table :luvits do |t|
      t.belongs_to :review, index: true

      t.timestamps
    end
  end
end
