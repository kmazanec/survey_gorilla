class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :option_id
      t.integer :taken_survey_id
      t.timestamps
    end
  end
end
