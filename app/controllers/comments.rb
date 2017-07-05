## COMMENT ON QUESTIONS

# get/display form for new comment on a question
get "/questions/:question_id/comments/new" do
  @question = Question.find(params[:question_id])
  @new_comment_on_question = true
  erb :"questions/show"
end

# post/persist a comment on a question
post '/questions/:question_id/comments' do
  comment = Comment.new(body:params[:body])
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

# general comment delete route (for questions and answers) 
# TODO: make a DELETE form button instead, for RESTfulness
get '/comments/:comment_id/delete' do
  comment = Comment.find(params[:comment_id])
  comment.destroy!

  if comment.commentable.class == Question
    redirect "/questions/#{comment.commentable.id}"
  else
    redirect "/questions/#{comment.commentable.question.id}"
  end
end


## COMMENT ON ANSWERS

# get/display form for new comment on an answer
get "/questions/:question_id/answers/:answer_id/comments/new" do
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:answer_id])
  @new_comment_on_answer = @answer.id
  erb :"questions/show"
end

# post/persist a comment on an answer
post '/questions/:question_id/answers/:answer_id/comments' do
  comment = Comment.new(body:params[:body])
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:answer_id])

  comment.commentable = @answer
  comment.commenter = current_user

  if comment.save
    erb :"/questions/show"
  else
    @errors = ["Comment cannot be blank"]
    erb :"/questions/show"
  end
end

# delete a comment on an answer
  # uses general comment delete route in the 'Questions' section above
