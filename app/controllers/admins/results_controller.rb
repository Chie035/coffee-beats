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
  end

  def edit
  end

  def update
  end

  private
    def result_params
      params.require(:result).permit(:result_type, :type_detail, :country)
    end

end
