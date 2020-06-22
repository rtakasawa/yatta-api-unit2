class MaterialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_material, only: [:show,:edit,:update,:destroy]
  before_action :check_material_user, only: [:show,:edit,:update,:destroy]

  def index
    @q = current_user.materials.ransack(params[:q])
    @materials = @q.result(distinct: true).order(status: :asc).order(updated_at: :desc).page(params[:page])
  end

  def new
    @material = current_user.materials.build
    if params[:category] == "book"
      @material.title = params[:title]
      @material.path = params[:path]
      @material.category = "book"
    end

    if params[:category] == "web"
      @material.title = params[:title]
      @material.path = params[:path]
      @material.category = "web"
    end
  end

  def create
    @material = current_user.materials.build(material_params)
    if @material.save
      redirect_to @material, notice: "教材が登録されました"
    else
      render "new"
    end
  end

  def show
    @q = @material.works.ransack(params[:q])
    @works = @q.result(distinct: true).order(do_on: :desc).page(params[:page]).per(10)
  end

  def edit; end

  def update
    if @material.update(material_params)
      redirect_to material_path(@material), notice: "教材情報は更新されました"
    else
      render "edit"
    end
  end

  def destroy
    @material.destroy
    redirect_to materials_path, notice: "教材は削除されました"
  end

  def search
    @search_id = params[:search_id]
    @search_keyword = params[:search_keyword]

    if params[:search_id] == "1"
      if params[:search_keyword].size >= 2
        items = RakutenWebService::Books::Book.search(title: params[:search_keyword])
        @books_full = []
        items.each do |item|
          @books_full.push(item)
        end
      end
      if @books_full.present?
        @books = Kaminari.paginate_array(@books_full).page(params[:page]).per(10)
      end
    else
      if params[:search_keyword].present?
        @items = QiitaItem.get(params[:search_keyword])
      else
        @items = "検索キーワードを入力してください"
      end
      unless @items.class == String
        @items = Kaminari.paginate_array(@items).page(params[:page]).per(30)
      end
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