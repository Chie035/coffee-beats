class AddIsAnswerToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :is_answer, :boolean, default:true, null:false
  end
end
