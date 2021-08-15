class Public::QuestionsController < ApplicationController

  def start
  end

  def show
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)

    case params[:id]
    when "1"
      if @question.is_answer == true
        redirect_to action:"show", id:2
      else
        redirect_to action:"show", id:3
      end
    when "2"
      if @question.is_answer == true
        redirect_to action:"show", id:4
      else
        redirect_to action:"show", id:5
      end
    when "3"
      if @question.is_answer == true
        redirect_to action:"show", id:5
      else
        redirect_to acrion:"show", id:4
      end
    when "4"
      redirect_to goal_1_questions_path
    when "5"
      redirect_to goal_2_questions_path
    end
  end

  def goal_1
    @questions = Question.all
    @result = Question.find(4)
  end

  def goal_2
    @questions = Question.all
    @result = Question.find(5)
  end

  private
  def question_params
    params.require(:question).permit(:is_answer)
  end

end
