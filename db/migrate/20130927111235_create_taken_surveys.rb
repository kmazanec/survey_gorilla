class CreateTakenSurveys < ActiveRecord::Migration
  def change
    create_table :taken_surveys do |t|
      t.integer :taker_id
      t.integer :survey_id
      t.timestamps
    end
  end
end
