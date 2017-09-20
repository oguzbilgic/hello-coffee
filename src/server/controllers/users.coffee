import React from 'react'
import User from '../models/user'
import Layout from '../views/layout'

export default
  index: (params, {render}) =>
    users = await User.find()

    render () =>
      <Layout>
        <div>
          <h3>Users Index</h3>

          {users.map (user) =>
            <div key={user.get '_id'}>
              <a href={"/users/" + user.get '_id'}>
                {user.get 'username'}
              </a>
            </div>
          }

          <a href='/users/new'>
            add user
          </a>
        </div>
      </Layout>

  show: ({id}, {render}) =>
    # user = await User.where(_id: id).findOne()
    user = await User.findOne()

    render () =>
      <div>
        Hello {user.get 'username'} <br />
        # id {user.get 'id'} <br />

        <a href={"/users/#{id}/edit"}>
          edit
        </a>

        <a href='/users'>
          index
        </a>
      </div>

  create: ({username}, {redirect}) =>
    user = new User username: username

    await user.save()

    redirect '/users'

  nev: ({id}, {render}) =>
    user = await User.findOne()

    render () =>
      <form action="/users/#{id}" method="post">
        <h3>User Form</h3>

        <input type='text' name='username'/>

        <button type='submit'>
          Submit
        </button>
      </form>

  edit: ({id}, {render}) =>
    user = await User.findOne()

    render () =>
      <form action="/users" method="post">
        <h3>Edit {user.get 'username'}</h3>

        <input type='text' name='username'/>

        <button type='submit'>
          Submit
        </button>

        <a href={"/users/#{id}"}>
          back
        </a>
      </form>

  update: ({id, username}, {redirect}) =>
    user = await User.findOne()
    user.set 'username', username
    await user.save()

    redirect "/users/#{id}"

  destroy: ({id}, {redirect}) =>
    user = await User.findOne()
    await user.remove()

    redirect "/users"
