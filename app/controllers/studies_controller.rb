class StudiesController < ApplicationController

  def index

  end

  def new
    @study = Study.new
    @studys = Study.all
  end

  def create
    @study = Study.new(studies_params)
    if @study.save
      redirect_to new_study_path
    else
      render :new
    end
  end

  def show
    @study = Study.find(params[:id])
  end

  def analysis
    @analysis1 = Analysis.find(1)
    @analysis2 = Analysis.find(2)
    @analysis3 = Analysis.find(3)
  end

  private
  def studies_params
    params.require(:study).permit(:method, :content, :reason, :price, :image)
  end

end
