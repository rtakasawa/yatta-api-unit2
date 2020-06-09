class Material < ApplicationRecord
  acts_as_taggable
  belongs_to :user
  has_many :works, dependent: :destroy
  validates :title, presence: true
  validates :category, presence: true
  # allow_blank: true:入力がブランク時はバリデーションをスキップ
  validates :path, format: /\A#{URI::regexp(%w(http https))}\z/, allow_blank: true
  enum category:{ book: 0, video: 1, web: 2, other: 3 }

  # # joinでcurrnt_user.materials.idとworksのmaterial_idがマッチするmaterialテーブルのレコードを取得
  # # whereメソッドで条件にあったレコードを取得する
  # # 条件①：各materialのworkの内、created_atが最新のレコード
  # # 条件②：①のworkのstatusが検索されたstatusに該当するmaterialを取得
  # scope :last_work_status, -> (last_work_status) { joins(:works).where(ここに条件①を入れたい).where(works: {status: last_work_status})
  #
  # # 案
  # # scope :last_work_status, -> (last_work_status) { joins(:works).where( works: {created_atが最新}).where(works: {status: last_work_status})
  # # scope :last_work_status, -> (last_work_status) { joins(materials::works).where( works: {created_atが最新}).where(works: {status: last_work_status})
  #
  # # これはいらない？
  # # .select('materials.*,works.*')
  # # 下記スコープでステータス検索で、各学習記録のステータスの最新の学習記録の中から、該当のステータスを出したかったが不可
  # # # SELECT  "works".* FROM "works" WHERE "works"."material_id" = $1
  # # # ORDER BY "works"."updated_at" DESC LIMIT $2  [["material_id", 5914], ["LIMIT", 1]]
  # # scope :last_work_status, -> (last_work_status) { joins(:works).order(updated_at: :desc).limit(1).where(status:last_work_status)}
  #
  # # Ransackで使うscopeを指定する。
  # # 戻り値はシンボルの配列を使う。
  # # デフォルトでは全てのscopeは認可されていない。
  # def self.ransackable_scopes(auth_object = nil)
  #   %i(last_work_status)
  # end
end