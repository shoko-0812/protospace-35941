class CommentsController < ApplicationController


  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype_id) # 今回の 実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです。
    else
      @prototype = Prototype.find(params[:prototype_id])# paramsの中([])の中が入ってる。
      # @comment = Comment.new #newを定義すると全てのコメントも消して新しく作り直してしまう。
      @comments = @prototype.comments.includes(:user) # 9.11行目の記述で変数の中に値が入ったので、nomethoderror値がないよエラーが出ない。
      render "prototypes/show" # views/tweets/show.html.erbのファイルを参照しています。
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end