class StudiesController < ApplicationController
  before_action :set_study, only: [:show, :edit, :update, :destroy]
  before_action :move_root_no_login, only: :finish
  before_action :move_sign_in_no_login, only: [:index, :new, :edit]

  def index
    @studies = Study.all
    @admins = Admin.all
  end

  def new
    @study = Study.new
  end

  def create
    @study = Study.new(studies_params)
    if @study.save
      redirect_to studies_path
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
      redirect_to studies_path
    else
      render :edit
    end
  end

  def destroy
    if @study.destroy
      redirect_to  studies_path
    else
      render :edit
    end
  end

  def analysis
    @analysis1 = Analysis.find(1)
    @analysis2 = Analysis.find(2)
    @analysis3 = Analysis.find(3)
  end

  def finish
    @user = current_user
    NotificationMailer.send_mail_to_user(@user).deliver
  end

  private
  def studies_params
    params.require(:study).permit(:method, :content, :reason, :price, :image, :url)
  end

  def set_study
    @study = Study.find(params[:id])
  end

  def move_root_no_login
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def move_sign_in_no_login
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end

end
