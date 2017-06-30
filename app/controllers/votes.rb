post '/answers/:id/votes' do
  @answer = Answer.find(params[:id])
  @answer.votes.create(value: params[:vote], voter_id: current_user.id)
  question_id = @answer.question.id
  redirect "/questions/#{question_id}"
end
