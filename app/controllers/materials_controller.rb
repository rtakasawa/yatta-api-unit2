class MaterialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_material, only: %i[show edit update destroy]
  before_action :check_material_user, only: %i[show edit update destroy]

  def index
    @current_user_materials_count = current_user.materials.count
    @q = current_user.materials.ransack(params[:q])
    @materials = @q.result(distinct: true).order(status: :asc).order(updated_at: :desc)
                   .includes(:taggings, :works).page(params[:page])
  end

  def new
    @material = current_user.materials.build
    return if params[:category].blank?

    @material.title = params[:title]
    @material.path = params[:path]
    @material.category = params[:category]
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

  def edit; end

  def update
    if @material.update(material_params)
      redirect_to material_path(@material), notice: '教材情報は更新されました'
    else
      render 'edit'
    end
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
      books_full = Book.get(@search_keyword)
      # 検索がヒットした場合の処理
      return @books = Kaminari.paginate_array(books_full).page(params[:page]).per(30) unless books_full.class == String

      # 検索がヒットしない場合の処理
      @books = books_full
    else
      @items = Qiita.get(@search_keyword)
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
