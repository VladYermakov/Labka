get '/' do
	@posts = Post.order("created_at DESC").limit(10)
	erb :index
end

get '/posts/:id/' do
  @post = Post.find(params[:id])
  @title = @post.title
  @content = @post.content
  erb :'posts/show'
end

get '/posts/new' do
  @title = 'Create new post'
  erb :'posts/create'
end

post '/posts/new' do
  params.delete 'submit'
  @post = Post.create(params)
  if @post.save
    redirect to '/'
  else
    'Post was not save'
  end
end

get ('/about/?') do
  @title = 'About me'
  erb :about
end

not_found do
  @title = 'Page not found'
  erb :'404'
end

error do
  @error = request.env['sinatra_error'].name
  erb :'500'
end

get '/posts/:id/edit/' do
  @title = 'Update post'
  @post = Post.find(params[:id])
  erb :'posts/edit'
end

put '/posts/:id/edit/' do
  @post = Post.find(params[:id])
  if @post.update_attributes(params[:post])
    redirect to '/'
  else
    erb :'posts/edit'
  end
end

get '/posts/:id/delete/' do
  @title = 'Confirm deletion of article ##{params[:id]}'
  @post = Post.find(params[:id])
  erb :'posts/delete'
end

delete '/posts/:id/' do
  Post.find(params[:id]).destroy
  redirect to '/'
end

get 'users' do
  @users User.all
  erb :"/users/index"
end
