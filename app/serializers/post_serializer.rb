class PostSerializer < ActiveModel::Serializer
  attributes :id, :id, :title, :body, :is_draft, :created_at

  def initialize(object, options={})

    meta_key = options[:meta_key] || :meta
    options[meta_key] ||= {}

    options[meta_key][:pagination] = {
      page: options[:params][:page].to_i,
      per_page: options[:params][:per_page],
      total_pages: (Post.all.size/options[:params][:per_page].to_f),
      total: Post.all.size
    }

    super(object, options)
  end
end
