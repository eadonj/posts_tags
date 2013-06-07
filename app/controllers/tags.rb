get '/tags' do
  @tags = Tag.all
  erb :tags
end

get '/tags/:id' do
  @tag = Tag.find(params[:id])
  erb :post_by_tag
end

