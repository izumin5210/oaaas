Global.oauth_providers.to_hash.each do |id, _|
  OauthProvider.seed do |provider|
    provider.id = id
  end
end
