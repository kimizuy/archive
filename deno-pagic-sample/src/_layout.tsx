// @deno-types="https://deno.land/x/types/react/v16.13.1/react.d.ts"
import React from 'https://dev.jspm.io/react@16.13.1'
import { PagicLayout } from 'https://raw.githubusercontent.com/xcatliu/pagic/master/pagic.ts'

const Layout: PagicLayout = ({ title, content }) => {
  return (
    <html>
      <head>
        <title>{title}</title>
        <meta charSet='utf-8' />
      </head>
      <body>{content}</body>
    </html>
  )
}

export default Layout
