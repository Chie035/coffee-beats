class Admins::ResultsController < ApplicationController

  def index
    @results = Result.all
  end

  def new
    @result = Result.new
  end

  def create
    @result = Result.new(result_params)
    @result.save

    redirect_to admins_results_path
  end

  def show
    @result = Result.find(params[:id])
  end

  def edit
    @result = Result.find(params[:id])
  end

  def update
    @result = Result.find(params[:id])
    @result.update(result_params)
    
    redirect_to admins_result_path(@result)
  end

  private
    def result_params
      params.require(:result).permit(:result_type, :type_detail, :country)
    end

end
