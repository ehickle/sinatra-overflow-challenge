post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answer_new = @question.answers.new(body: params[:body], author_id: current_user.id)
  if @answer_new.save
    redirect "/questions/#{@question.id}"
  else
    @error = ['try again']
    @answer_new.delete
    redirect "/questions/#{@question.id}"
  end
end

delete '/answers/:id' do
  answer = Answer.find(params[:id])
  question_id = answer.question.id
  answer.destroy!
  redirect "/questions/#{question_id}"
end

put '/questions/:question_id/answers/:answer_id/best' do
  @answer = Answer.find(params[:answer_id])
  @question = Question.find(params[:question_id])
  @question.best_answer_id = @answer.id
  @question.save
  redirect "/questions/#{params[:question_id]}"
end