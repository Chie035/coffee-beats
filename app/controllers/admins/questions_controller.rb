class Admins::QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
    @question = Question.new
  end
  
  def create
    @question = Question.new(question_params)
    @question.save
    
    redirect_to admins_questions_path
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    
    redirect_to admins_questions_path
  end
  
  private
  def question_params
    params.require(:question).permit(:question)
  end
end
