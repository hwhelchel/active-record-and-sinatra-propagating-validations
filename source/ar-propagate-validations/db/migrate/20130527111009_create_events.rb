class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :organizer_name, :organizer_email, :title
      t.date :date
    end

    add_index :events, :title, unique: true
  end
end
