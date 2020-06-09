class WorksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_work, only: [:show,:edit,:update,:destroy]

  def new
    @materials = current_user.materials
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to material_path(@work.material_id), success: "学習情報が登録されました"
    else
      render "new"
    end
  end

  def show; end

  def edit; end

  def update
    if @work.update(work_params)
      redirect_to material_path(@work.material_id), info: "学習情報は更新されました"
    else
      render "edit"
    end
  end

  def destroy
    @work.destroy
    redirect_to material_path(@work.material_id), info: "学習情報は削除されました"
  end

  private

  # material_idを含めたが勝手に入力されることはないか心配
  # work新規登録時の教材選びの際にmaterial_idを利用
  def work_params
    params.require(:work).permit(:start, :finish, :content, :status, :material_id)
  end

  def set_work
    @work = Work.find(params[:id])
  end
end
