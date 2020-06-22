class WorksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_work, only: [:show,:edit,:update,:destroy]
  before_action :check_work_user, only: [:show,:edit,:update,:destroy]

  def index
    @q = current_user.works.ransack(params[:q])
    @works = @q.result(distinct: true).order(do_on: :desc).page(params[:page]).per(10)
    @works_for_calendar = current_user.works
    @all_works_count = current_user.works.count
    @current_month_work_count = current_user.works.current_month.count
    @last_month_work_count = current_user.works.last_month.count
  end

  def new
    # # カレンダー用試作
    @materials = current_user.materials
    @work = Work.new

    # 下記が正しい（Calendarのためコメントアウト）
    # if params[:material_id].present?
    #   @materials = Material.find(params[:material_id])
    # else
    #   @materials = current_user.materials
    # end
    # @work = Work.new
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