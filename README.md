NOTE: This repository has a successor project that doesn't depend on jsonapi-resources: https://github.com/krainboltgreene/jsonapi-home.rb 

# jsonapi-resources-home

  - [![Build](http://img.shields.io/travis-ci/krainboltgreene/jsonapi-resources-home.rb.svg?style=flat-square)](https://travis-ci.org/krainboltgreene/jsonapi-resources-home.rb)
  - [![License](http://img.shields.io/badge/license-ISC-brightgreen.svg?style=flat-square)](http://opensource.org/licenses/ISC)
  - [![Version](http://img.shields.io/gem/v/jsonapi-resources-home.svg?style=flat-square)](https://rubygems.org/gems/jsonapi-resources-home)

An implementation of JSONAPIHome (which is a fork of JSONHome).


## Using

First, set yourself up with a `HOME_LOCATION`, this is the protocol+hostname[+suffix] combination where your api exists:

```
HOME_LOCATION=https://origin.example.com
```

To have this all work you just need to mount the engine:

``` ruby
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount JSONAPI::Resources::Home::Engine, at: "/"

  namespace :v1 do
    jsonapi_resources :accounts
  end
end
```

This will setup the basic set of home routes, and with this request:

```
* Preparing request to http://localhost:3000/v1/resources
* Enable automatic URL encoding
* Enable SSL validation
* Enable cookie sending with jar of 0 cookies
* Found bundle for host localhost: 0x7fe522cdb340 [can pipeline]
* Re-using existing connection! (#29) with host localhost
* Connected to localhost (::1) port 3000 (#29)
> GET /v1/resources HTTP/1.1
> Host: localhost:3000
> User-Agent: insomnia/5.9.6
> Accept: */*
> Accept-Encoding: deflate, gzip
```

You'll get this payload:

``` json
{
  "data": []
}
```

The reason nothing shows up is because we need to opt-in to the jsonapi home endpoint:

``` ruby
module V1
  class AccountsController < V1::ApplicationController
    home_discoverable description: "The accounts resource"
  end
end

```

Which results in this payload:

``` json
{
  "data": [
    {
      "id": "accounts-v1-list",
      "type": "resources",
      "links": {
        "self": "http://localhost:3000/jsonapi/resources/home/v1/resources/accounts-v1-list"
      },
      "attributes": {
        "namespace": "accounts",
        "version": "v1",
        "intent": "list",
        "verb": "GET",
        "href": "http://home.example.com/v1/accounts",
        "allowed": null,
        "mediatype": "application/vnd.api+json",
        "description": "The accounts resource",
        "created-at": "2017-11-10T00:27:39.039-08:00",
        "updated-at": "2017-11-10T00:27:39.043-08:00"
      }
    },
    {
      "id": "accounts-v1-create",
      "type": "resources",
      "links": {
        "self": "http://localhost:3000/jsonapi/resources/home/v1/resources/accounts-v1-create"
      },
      "attributes": {
        "namespace": "accounts",
        "version": "v1",
        "intent": "create",
        "verb": "POST",
        "href": "http://home.example.com/v1/accounts",
        "allowed": null,
        "mediatype": "application/vnd.api+json",
        "description": "The accounts resource",
        "created-at": "2017-11-10T00:27:39.039-08:00",
        "updated-at": "2017-11-10T00:27:39.044-08:00"
      }
    },
    {
      "id": "accounts-v1-show",
      "type": "resources",
      "links": {
        "self": "http://localhost:3000/jsonapi/resources/home/v1/resources/accounts-v1-show"
      },
      "attributes": {
        "namespace": "accounts",
        "version": "v1",
        "intent": "show",
        "verb": "GET",
        "href": "http://home.example.com/v1/accounts/{id}",
        "allowed": null,
        "mediatype": "application/vnd.api+json",
        "description": "The accounts resource",
        "created-at": "2017-11-10T00:27:39.039-08:00",
        "updated-at": "2017-11-10T00:27:39.044-08:00"
      }
    },
    {
      "id": "accounts-v1-update",
      "type": "resources",
      "links": {
        "self": "http://localhost:3000/jsonapi/resources/home/v1/resources/accounts-v1-update"
      },
      "attributes": {
        "namespace": "accounts",
        "version": "v1",
        "intent": "update",
        "verb": "PATCH",
        "href": "http://home.example.com/v1/accounts/{id}",
        "allowed": null,
        "mediatype": "application/vnd.api+json",
        "description": "The accounts resource",
        "created-at": "2017-11-10T00:27:39.039-08:00",
        "updated-at": "2017-11-10T00:27:39.045-08:00"
      }
    },
    {
      "id": "accounts-v1-update",
      "type": "resources",
      "links": {
        "self": "http://localhost:3000/jsonapi/resources/home/v1/resources/accounts-v1-update"
      },
      "attributes": {
        "namespace": "accounts",
        "version": "v1",
        "intent": "update",
        "verb": "PATCH",
        "href": "http://home.example.com/v1/accounts/{id}",
        "allowed": null,
        "mediatype": "application/vnd.api+json",
        "description": "The accounts resource",
        "created-at": "2017-11-10T00:27:39.039-08:00",
        "updated-at": "2017-11-10T00:27:39.045-08:00"
      }
    },
    {
      "id": "accounts-v1-destroy",
      "type": "resources",
      "links": {
        "self": "http://localhost:3000/jsonapi/resources/home/v1/resources/accounts-v1-destroy"
      },
      "attributes": {
        "namespace": "accounts",
        "version": "v1",
        "intent": "destroy",
        "verb": "DELETE",
        "href": "http://home.example.com/v1/accounts/{id}",
        "allowed": null,
        "mediatype": "application/vnd.api+json",
        "description": "The accounts resource",
        "created-at": "2017-11-10T00:27:39.039-08:00",
        "updated-at": "2017-11-10T00:27:39.046-08:00"
      }
    }
  ]
}
```

You can also inquire about individual endpoints:

```
* Preparing request to http://localhost:3000/v1/resources/accounts-v1-list
* Enable automatic URL encoding
* Enable SSL validation
* Enable cookie sending with jar of 0 cookies
* Connection 65 seems to be dead!
* Closing connection 65
*   Trying ::1...
* TCP_NODELAY set
* Connected to localhost (::1) port 3000 (#66)
> GET /v1/resources/accounts-v1-list HTTP/1.1
> Host: localhost:3000
> User-Agent: insomnia/5.9.6
> Accept: */*
> Accept-Encoding: deflate, gzip
```

``` json
{
  "data": {
    "id": "accounts-v1-list",
    "type": "resources",
    "links": {
      "self": "http://localhost:3000/jsonapi/resources/home/v1/resources/accounts-v1-list"
    },
    "attributes": {
      "namespace": "accounts",
      "version": "v1",
      "intent": "list",
      "verb": "GET",
      "href": "http://home.example.com/v1/accounts",
      "allowed": null,
      "mediatype": "application/vnd.api+json",
      "description": "The accounts resource",
      "created-at": "2017-11-10T01:01:28.576-08:00",
      "updated-at": "2017-11-10T01:01:28.582-08:00"
    }
  }
}
```

Because it's jsonapi.org you can use all the normal interfaces.


## Installing

Install with gemrat:

  $ gemrat jsonapi-resources-home


## Contributing

  1. Read the [Code of Conduct](/CONDUCT.md)
  2. Fork it
  3. Create your feature branch (`git checkout -b my-new-feature`)
  4. Commit your changes (`git commit -am 'Add some feature'`)
  5. Push to the branch (`git push origin my-new-feature`)
  6. Create new Pull Request
