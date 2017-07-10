post '/answers/:id/votes' do
  @answer = Answer.find(params[:id])
  @answer.votes.create(value: params[:vote], voter_id: current_user.id)
  question_id = @answer.question.id
  redirect "/questions/#{question_id}"
end

post '/questions/:id/votes' do
  @question = Question.find(params[:id])
  @question.votes.create(value: params[:vote], voter_id: current_user.id)
  redirect "/questions/#{ @question.id }"
end

put '/questions/:question_id/votes/:vote_id/edit' do
  vote = Vote.find(params[:vote_id])
  vote.value = params[:vote_value]
  vote.save
  redirect "/questions/#{ params[:question_id] }"
end

put '/answers/:answer_id/votes/:vote_id/edit' do
  vote = Vote.find(params[:vote_id])
  vote.value = params[:vote_value]
  vote.save

  answer = Answer.find(params[:answer_id])
  question_id = answer.question.id
  redirect "/questions/#{ question_id }"
end
