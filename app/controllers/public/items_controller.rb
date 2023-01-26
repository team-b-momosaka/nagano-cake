class Public::ItemsController < ApplicationController
  def index

    #ページネーション用に書き換えた。8個まで表示する。
    if params[:genre_id].blank? # genre_idが空かどうか blank?でチェック。

      @items = Item.page(params[:page]).per(8)
      @items_all = Item.all.count #countで、余分なデータを限定
      @genres = Genre.all
      @index = "商品"

    else
       # ジャンルを押したら
        #そのジャンルのアイテムが表示されるようにする

        @genre = Genre.find(params[:genre_id]) #viewのlink_toで、送った(params[:genre_id])を使い、genreを一件持ってくる
        @items = @genre.items.page(params[:page]).per(8) #ジャンルを一件持ってきた後、そのIDををもってるアイテムを呼ぶ
        @items_all = @genre.items.count #カウント用にジャンルの全件データ取得
        @genres = Genre.all   #ジャンル一覧
        @index = @genre.genre #@genreでジャンルの名前を入れる
      end



  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end



end
