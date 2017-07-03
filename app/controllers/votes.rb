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
