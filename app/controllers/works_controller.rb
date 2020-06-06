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
      redirect_to materials_path, success: "学習情報が登録されました"
    else
      render "new"
    end
  end


  def edit; end

  def update
    if @work.update(work_params)
      @material = Material.find(params[:material_id])
      redirect_to material_path(@material), info: "学習情報は更新されました"
    else
      render "edit"
    end
  end

  def destroy
    @work.destroy
    @material = Material.find(params[:material_id])
    redirect_to material_path(@material), info: "学習情報は削除されました"
  end

  private

  # material_idを含めたが勝手に入力されることはないか心配
  def work_params
    params.require(:work).permit(:start, :end, :content, :status, :material_id)
  end

  def set_work
    @work = Work.find(params[:id])
  end
end
