import React from 'react'

export default ({children}) =>
  <div>
    <h3>Layout Header</h3>
    {children}

    <div id='root' />

    <script src="/index.js" />
  </div>
