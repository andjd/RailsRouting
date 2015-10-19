require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users.html'
).to_s
url_post = "1"
puts RestClient.get(url)


def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s
  begin
    puts RestClient.post(
      url,
      { user: { name: 'Gizmo', email: 'gizmo@gizmo.gizmo' } }
    )
  rescue RestClient::Exception
  end
end

def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/5.json'
  ).to_s
  begin
    puts RestClient.patch(
      url,
      { user: { name: 'mo' } }
    )
  rescue RestClient::Exception
  end
end

def destroy_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/5.json'
  ).to_s

  begin
    puts RestClient.delete(url)
  rescue RestClient::Exception
  end
end

create_user

update_user

destroy_user
