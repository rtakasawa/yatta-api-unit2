class MaterialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show,:edit,:update,:destroy]

  def index
    @materials = current_user.materials.all
  end

  def new
    @material = current_user.materials.build
  end

  def create
    @material = current_user.materials.build(material_params)
    if @material.save
      redirect_to @material, success: "教材が登録されました"
    else
      render "new"
    end
  end

  def show; end

  def edit; end

  def destroy
    @material.destroy
    redirect_to materials_path, info: "教材は削除されました"
  end

  # 書籍検索のアクションを定義する
  # def search_book
  #
  # end

  private

  def material_params
    params.require(:material).permit(:title, :author, :category, :path, :note)
  end

  def set_task
    @material = Material.find(params[:id])
  end
end