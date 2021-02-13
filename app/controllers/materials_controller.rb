class MaterialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_material, only: %i[show edit update destroy change_complete change_learning]
  before_action :check_material_user, only: %i[show edit update destroy change_complete change_learning]

  def index
    @current_user_materials_count = current_user.materials.count
    @q = current_user.materials.ransack(params[:q])
    @materials = @q.result(distinct: true).order(status: :asc).order(updated_at: :desc).includes(:taggings, :works).page(params[:page])
  end

  def new
    @material = current_user.materials.build
    return if params[:category].blank?

    @material.title = params[:title]
    @material.path = params[:path]
    @material.category = params[:category]
    @material.tag_list = params[:tag_list] if params[:tag_list]
  end

  def create
    @material = current_user.materials.build(material_params)
    if @material.save
      redirect_to @material, notice: '教材が登録されました'
    else
      render 'new'
    end
  end

  def show
    @q = @material.works.ransack(params[:q])
    @works = @q.result(distinct: true).order(do_on: :desc).page(params[:page]).per(10)
  end

  def edit
    # @materialのstatusがcompleteの場合にアクセスするとエラー
    authorize @material
  end

  def update
    # @materialのstatusがcompleteの場合にアクセスするとエラー
    authorize @material
    if @material.update(material_params)
      redirect_to material_path(@material), notice: '教材情報は更新されました'
    else
      render 'edit'
    end
  end

  # 学習完了にする場合のアクション
  def change_complete
    # @materialのstatusがcompleteの場合にアクセスするとエラー
    authorize @material
    # materal,workどちらもupdateできれば処理成功
    # errorの場合はrollbackして500エラー
    @material.transaction do
      @material.update!(status: 1)
      @material.works.each { |work| work.update!(status: 1) }
    end
    redirect_to @material,  notice: '学習状況は、学習完了に変更されました'
  end

  # 学習中にする場合のアクション
  def change_learning
    # @materialのstatusがlearningの場合にアクセスするとエラー
    authorize @material
    # materal,workどちらもupdateできれば処理成功
    # errorの場合はrollbackして500エラー
    @material.transaction do
      @material.update!(status: 0)
      @material.works.each { |work| work.update!(status: 0) }
    end
    redirect_to @material,  notice: '学習状況は、学習中に変更されました'
  end

  def destroy
    @material.destroy
    redirect_to materials_path, notice: '教材は削除されました'
  end

  # 本、Qiitaの検索メソッド
  def search
    @search_id = params[:search_id]
    @search_keyword = params[:search_keyword]

    # 本の検索
    if @search_id == '1'
      book_search_result = Book.get(@search_keyword)
      # 検索がヒットしない場合の処理
      return @books = book_search_result unless book_search_result.class == Array
      # 検索がヒットした場合の処理
      @books = Kaminari.paginate_array(book_search_result).page(params[:page]).per(30)
    end
    # Qiitaの検索
    return @items = Qiita.get(@search_keyword) if @search_id == '2'
    # Udemyの検索
    if @search_id == '3'
      udemy_search_result = Udemy.new(@search_keyword).result
      # 検索がヒットしない場合の処理
      return @udemys = udemy_search_result if udemy_search_result.class == String
      # 検索がヒットした場合の処理
      @udemys = Kaminari.paginate_array(udemy_search_result).page(params[:page]).per(30)
    end
  end

  private

  def material_params
    params.require(:material).permit(:title, :category, :path, :note, :status, :tag_list)
  end

  def set_material
    @material = Material.find(params[:id])
  end

  def check_material_user
    redirect_to materials_path unless @material.user_id == current_user.id
  end
end
