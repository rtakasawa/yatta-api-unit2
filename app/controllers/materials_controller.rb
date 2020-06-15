class MaterialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_material, only: [:show,:edit,:update,:destroy]
  before_action :check_material_user, only: [:show,:edit,:update,:destroy]

  def index
    @q = current_user.materials.ransack(params[:q])
    @materials = @q.result(distinct: true).page(params[:page])
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
    # @works = @material.works.order(created_at: :desc).page(params[:page]).per(10)
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

  # 楽天APIから書籍情報を取得
  # 本のタイトルで検索。検索条件は不明確だが、おそらく曖昧検索
  # 今はデフォルトの30件しか検索情報が取得できない
  # ページネーション追加後に取得情報を増やせるか確認する
  # →動的な設定が必要。一旦保留
  # 2文字以上検索ワードを入れないとエラーになる。とりあえずビューで制約した
  def book_search
    if params[:keyword].size >= 2
      items = RakutenWebService::Books::Book.search(title: params[:keyword])
      @books_full = []
      items.each do |item|
        @books_full.push(item)
      end
    end
    if @books_full.present?
      @books = Kaminari.paginate_array(@books_full).page(params[:page]).per(10)
    end
  end

  # # ページネーション不要の場合は下記コード
  # def book_search
  #   if params[:keyword].size
  #     @books = RakutenWebService::Books::Book.search(title: params[:keyword]).page(params[:page])
  #   end
  # end

  def qiita_search
    if params[:keyword].present?
      @items = QiitaItem.get(params[:keyword])
    else
      @items = "検索キーワードを入力してください"
    end

    unless @items.class == String
      @items = Kaminari.paginate_array(@items).page(params[:page]).per(30)
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