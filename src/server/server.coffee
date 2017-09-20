import {Server} from 'hapi'
import Path from 'path'
import Inert from 'inert'
import React from 'react'
import ReactDOMServer from 'react-dom/server'

export default (resources) =>
  server = new Server()

  server.connection host: 'localhost', port: 8080
  server.register Inert, () => {}

  addHandler = (method, path, action) =>
    handler = ({params, payload}, reply) =>
      redirect = (uri) =>
        reply.redirect uri

      render = (Component) =>
        element = React.createElement Component, props
        html = ReactDOMServer.renderToStaticMarkup element
        reply html

      props = Object.assign {}, payload, params

      action props, {render, redirect}

    server.route {path, method, handler}

  resource = (name, {index, nev, create, show, edit, update}) =>
    addHandler 'GET', "/#{name}/new", nev
    addHandler 'GET', "/#{name}/{id}/edit", edit
    addHandler 'POST', "/#{name}/{id}", update
    addHandler 'GET', "/#{name}/{id}", show
    addHandler 'POST', "/#{name}", create
    addHandler 'GET', "/#{name}", index

  for name, controller of resources
    resource name, controller

  console.log Path.join(__dirname, '../public')

  server.route
    method: 'GET'
    path: '/{param*}'
    handler:
      directory:
        path: Path.join(__dirname, '../public')

  server.start (err) =>
    throw err if err

    console.log 'Server is running at: ', server.info.uri
