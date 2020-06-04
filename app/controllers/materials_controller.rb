class MaterialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show,:edit,:update,:destroy]

  def index
    @materials = current_user.materials.all
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

  def show; end

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
  # ２文字以上検索ワードを入れないとエラーになる。とりあえずビューで制約した
  def book_search
    if params[:keyword].size
      @books = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
  end

  private

  def material_params
    params.require(:material).permit(:title, :author, :category, :path, :note)
  end

  def set_task
    @material = Material.find(params[:id])
  end
end