json.extract! blog, :id, :title, :content, :time, :like, :created_at, :updated_at
json.url blog_url(blog, format: :json)