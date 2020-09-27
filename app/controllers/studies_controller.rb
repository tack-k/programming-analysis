class StudiesController < ApplicationController
  before_action :set_study, only: [:show, :edit, :update, :destroy]

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

  end

  def edit

  end

  def update
    if @study.update(studies_params)
      redirect_to new_study_path
    else
      render :edit
    end
  end

  def destroy
    if @study.destroy
      redirect_to new_study_path
    else
      render :edit
    end
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

  def set_study
    @study = Study.find(params[:id])
  end

end
