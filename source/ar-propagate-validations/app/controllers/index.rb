get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :"/events/show"
end

get '/events/new' do
  
  erb :"/events/new"
end

post '/events' do
  @event = Event.create(params[:event])
  if @event.valid?
    redirect "/events/#{@event.id}/show"
  else
    @errors = @event.errors.messages
    erb :"/events/new"
  end
end

not_found do
  redirect '/'
end