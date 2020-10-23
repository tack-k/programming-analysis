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
      redirect_to studies_path
    else
      render :edit
    end
  end

  def analysis
    @analysis1 = Analysis.find(1)
    @analysis2 = Analysis.find(2)
    @analysis3 = Analysis.find(3)
    @study1 = Study.find_by(method: 'デイトラ')
    @study2 = Study.find_by(method: 'プロゲート')
    @study3 = Study.find_by(method: 'TECH CAMP エンジニア転職')
    @study4 = Study.find_by(method: 'TECH CAMP プログラミング教養')
    @study5 = Study.find_by(method: 'Udemy')
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
    redirect_to root_path unless user_signed_in?
  end

  def move_sign_in_no_login
    redirect_to new_admin_session_path unless admin_signed_in?
  end
end
