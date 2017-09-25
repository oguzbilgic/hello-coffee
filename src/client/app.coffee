import React from 'react'
import {
  BrowserRouter,
  Route,
  Link
} from 'react-router-dom'
import Counter from './pages/counter.coffee'

export default () =>
  <BrowserRouter>
    <div>
      <div>
        <Link to='/'>Home</Link>
        <Link to='/counter'>Counter</Link>
        <Link to='/about'>About</Link>
      </div>
      
      <Route exact path="/" component={Counter}/>
      <Route exact path="/counter" component={Counter}/>
      <Route exact path="/about" component={Counter}/>
    </div>
  </BrowserRouter>
