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
    # 本の検索
    if params[:search_id] == "1"
      if params[:search_keyword].size >= 2
        items = RakutenWebService::Books::Book.search(title: params[:search_keyword])
        # Kaminariのページネーションのため、配列に入れる
        @books_full = []
        # allとすることで、全ての検索結果を取得できる
        items.all.map do |item|
          @books_full.push(item)
        end
        if @books_full.present?
          @books = Kaminari.paginate_array(@books_full).page(params[:page]).per(30)
        else
          @books = t("view.material.couldn't_find_any_hits_in_my_search")
        end
      elsif params[:search_keyword].size == 1
        @books = t("view.material.please_enter_at_least_2characters_for_the_search_word")
      else
        @books = t("view.material.please_enter_a_search keyword")
      end
      # Qiita検索
    else
      if params[:search_keyword].present?
        @items = Qiita.get(params[:search_keyword])
      else
        @items = t("view.material.please_enter_a_search keyword")
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