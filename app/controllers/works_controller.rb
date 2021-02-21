class WorksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_work, only: %i[show edit update destroy]
  before_action :check_work_user, only: %i[show edit update destroy]

  def index
    @q = current_user.works.ransack(params[:q])
    @works = @q.result(distinct: true).order(do_on: :desc).includes(:material).page(params[:page]).per(10)
    @current_user_works = current_user.works # index.json用
  end

  def new
    @materials = current_user.materials.where(status: "learning")
    specific_material = current_user.materials.where(status: "learning").find_by(id: params[:material_id])
    @work = Work.new
    @work.material = specific_material
  end

  def create
    @work = Work.new(work_params)
    # materialのstatusがcompleteの場合にアクセスするとエラー
    authorize @work
    if @work.save
      redirect_to material_path(@work.material_id), notice: '学習情報が登録されました'
    else
      @materials = current_user.materials
      render 'new'
    end
  end

  def show; end

  def edit
    authorize @work
  end

  def update
    authorize @work
    if @work.update(work_params)
      redirect_to material_path(@work.material_id), notice: '学習情報は更新されました'
    else
      render 'edit'
    end
  end

  def destroy
    @work.destroy
    redirect_to material_path(@work.material_id), notice: '学習情報は削除されました'
  end

  private

  # work新規登録時の教材選びの際にmaterial_idを利用
  # material_idを含めたが勝手に入力されることはないか心配
  def work_params
    params.require(:work).permit(:start, :finish, :content, :do_on, :status, :material_id)
  end

  def set_work
    @work = Work.find(params[:id])
  end

  def check_work_user
    redirect_to materials_path unless @work.material.user_id == current_user.id
  end
end
