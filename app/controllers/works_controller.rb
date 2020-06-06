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
      redirect_to materials_path, success: "教材が登録されました"
    else
      render "new"
    end
  end

  # def show; end
  #
  # def edit; end
  #
  # def update
  #   if @material.update(material_params)
  #     redirect_to material_path(@material), info: "教材情報は更新されました"
  #   else
  #     render "edit"
  #   end
  # end
  #
  # def destroy
  #   @material.destroy
  #   redirect_to materials_path, info: "教材は削除されました"
  # end

  private

  def work_params
    params.require(:work).permit(:start, :end, :content, :status, :material_id)
  end

  def set_work
    @material = Material.find(params[:id])
  end
end
