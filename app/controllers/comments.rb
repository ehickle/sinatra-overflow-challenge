## COMMENT ON QUESTIONS

# get/display form for new comment on a question
get "/questions/:question_id/comments/new" do
  @question = Question.find(params[:question_id])
  if request.xhr?
    # some stuff
    erb :"questions/_comment_form", layout: false
  else
    @new_comment_on_question = true
    erb :"questions/show"
  end
end

# post/persist a comment on a question
post '/questions/:question_id/comments' do
    comment             = Comment.new(body:params[:body])
    @question           = Question.find(params[:question_id])
    comment.commentable = @question
    comment.commenter   = current_user
  if request.xhr?
    if comment.save
      content_type :json
        {
          id: comment.id,
          body: comment.body,
          time_since_creation: comment.time_since_creation,
          commenter: comment.commenter.username,
          commenter_id: comment.commenter.id
        }.to_json
    else
      status 422
    end
  else


    if comment.save
      erb :"/questions/show"
    else
      @errors = ["Comment cannot be blank"]
      erb :"/questions/show"
    end
  end
end

# general comment delete route (for questions and answers)
# TODO: make a DELETE form button instead, for RESTfulness
get '/comments/:comment_id/delete' do
  comment = Comment.find(params[:comment_id])

  if request.xhr?
    if comment.destroy!
      status 200
    else
      status 422
    end

  else
    comment.destroy!
    if comment.commentable.class == Question
      redirect "/questions/#{comment.commentable.id}"
    else
      redirect "/questions/#{comment.commentable.question.id}"
    end
  end
end


## COMMENT ON ANSWERS

# get/display form for new comment on an answer
get "/questions/:question_id/answers/:answer_id/comments/new" do
  @question              = Question.find(params[:question_id])
  @answer                = Answer.find(params[:answer_id])
  @new_comment_on_answer = @answer.id
  if request.xhr?
    erb :"questions/_comment_form", layout: false
  else
    erb :"questions/show"
  end
end

# post/persist a comment on an answer
post '/questions/:question_id/answers/:answer_id/comments' do
  comment   = Comment.new(body:params[:body])
  @question = Question.find(params[:question_id])
  @answer   = Answer.find(params[:answer_id])

  comment.commentable = Answer.find(params[:answer_id])
  comment.commenter   = current_user

  if request.xhr?
    if comment.save
      content_type :json
        {
          id: comment.id,
          body: comment.body,
          time_since_creation: comment.time_since_creation,
          commenter: comment.commenter.username,
          commenter_id: comment.commenter.id
        }.to_json
    else
      status 422
    end
  else

    if comment.save
      erb :"/questions/show"
    else
      @errors = ["Comment cannot be blank"]
      erb :"/questions/show"
    end
  end
end

# delete a comment on an answer
  # uses general comment delete route in the 'Questions' section above
