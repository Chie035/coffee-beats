class Public::ResultsController < ApplicationController
  
  def index
    @results = Result.all
  end
  
  def show
    @result = Result.find(params[:id])
  end
  
end
