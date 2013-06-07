get '/posts' do
 @posts = Post.all
 p @posts
 erb :posts
end

get '/posts/new' do
  p "form to create posts"
  erb :create
end

get '/posts/:id' do
 p  "show post #{params[:id]}"
 @post = Post.find(params[:id])
  erb :single_post
end

post '/posts' do
  post = Post.create(params[:post])
  names = params[:tags].split(",")
  names.each do |name|
    post.tags << Tag.find_or_create_by_name(name.strip)
  end
  redirect "/posts/#{post.id}"
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :edit
end

put '/posts' do
  p params[:id]
  p params[:post]
  post = Post.find(params[:id])
  p post
  post.update_attributes(params[:post])
  post.save
  redirect "/posts/#{post.id}"
end

delete '/posts/:id' do
  Post.delete(params[:id])
end
