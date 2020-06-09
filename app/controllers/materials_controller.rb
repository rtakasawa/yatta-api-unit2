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
      @material.author = params[:author]
      @material.path = params[:path]
      @material.category = "book"
    end
  end

  def create
    @material = current_user.materials.build(material_params)
    if @material.save
      redirect_to @material, success: "教材が登録されました"
    else
      render "new"
    end
  end

  def show
    @works = @material.works.order(created_at: :desc).page(params[:page]).per(10)
  end

  def edit; end

  def update
    if @material.update(material_params)
      redirect_to material_path(@material), info: "教材情報は更新されました"
    else
      render "edit"
    end
  end

  def destroy
    @material.destroy
    redirect_to materials_path, info: "教材は削除されました"
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
    else

    end
  end

  # # ページネーション不要の場合は下記コード
  # def book_search
  #   if params[:keyword].size
  #     @books = RakutenWebService::Books::Book.search(title: params[:keyword]).page(params[:page])
  #   end
  # end

  private

  def material_params
    params.require(:material).permit(:title, :author, :category, :path, :note, :tag_list)
  end

  def set_material
    @material = Material.find(params[:id])
  end

  def check_material_user
    redirect_to materials_path unless @material.user_id == current_user.id
  end

end