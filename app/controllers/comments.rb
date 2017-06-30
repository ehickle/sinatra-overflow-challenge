get "/questions/:question_id/comments/new" do
  @question = Question.find(params[:question_id])
  @new_comment = true
  erb :"questions/show"
end

post '/questions/:question_id/comments' do
  comment = Comment.new(body:params[:body])
  # we are here!! associate comment with user/question
  # p comment
  # p comment.question
  @question = Question.find(params[:question_id])

  comment.commentable = Question.find(params[:question_id])
  comment.commenter = current_user

  if comment.save
    erb :"/questions/show"
  else
    @errors = ["Comment cannot be blank"]
    erb :"/questions/show"
  end
end

delete 'comments/:comment_id' do
  comment = Comment.find[:comment_id]
  comment.destroy!
  redirect "/questions/#{comment.commentable.id}"
end
