require 'amazon/ecs'


module ProductsHelper

# alternatively,
Amazon::Ecs.configure do |options|
   options[:associate_tag] = 'collaborrow-20'
   options[:AWS_access_key_id] = 'AKIAIQFI42FVNMQSOJ6A'
   options[:AWS_secret_key] = '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'
end
  
# options provided on method call will merge with the default options
def item_search(item)
  res = Amazon::Ecs.item_search(item, {:response_group => 'Medium', :sort => 'salesrank'})
  p res
end

end
