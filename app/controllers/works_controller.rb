class WorksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_work, only: [:show,:edit,:update,:destroy]
  before_action :check_work_user, only: [:show,:edit,:update,:destroy]

  def index
    @works = current_user.works
  end

  def new
    @materials = current_user.materials
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to material_path(@work.material_id), notice: "学習情報が登録されました"
    else
      @materials = current_user.materials
      render "new"
    end
  end

  def show; end

  def edit; end

  def update
    if @work.update(work_params)
      redirect_to material_path(@work.material_id), notice: "学習情報は更新されました"
    else
      render "edit"
    end
  end

  def destroy
    @work.destroy
    redirect_to material_path(@work.material_id), notice: "学習情報は削除されました"
  end

  private

  # material_idを含めたが勝手に入力されることはないか心配
  # work新規登録時の教材選びの際にmaterial_idを利用
  def work_params
    params.require(:work).permit(:start, :finish, :content, :do_on, :material_id)
  end

  def set_work
    @work = Work.find(params[:id])
  end

  def check_work_user
    redirect_to materials_path unless @work.material.user_id == current_user.id
  end
end