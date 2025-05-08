/** @jsxImportSource @emotion/react */


import { Fragment, useContext, useEffect } from "react"
import { EventLoopContext, StateContexts } from "$/utils/context"
import { Event, isTrue } from "$/utils/state"
import NextHead from "next/head"



export function Fragment_c410719da887402f78ba4109549acfdd () {
  
  const reflex___state____state__integracion_minimal_web_page___states___stock_state____stock_state = useContext(StateContexts.reflex___state____state__integracion_minimal_web_page___states___stock_state____stock_state)





  
  return (
    <Fragment>

{!((reflex___state____state__integracion_minimal_web_page___states___stock_state____stock_state.error_message === "")) ? (
  <Fragment>

<p>

{reflex___state____state__integracion_minimal_web_page___states___stock_state____stock_state.error_message}
</p>
</Fragment>
) : (
  <Fragment>

{null}
</Fragment>
)}
</Fragment>
  )
}

export function P_d1c4f46822db604f21686631d3493d85 () {
  
  const reflex___state____state__integracion_minimal_web_page___states___stock_state____stock_state = useContext(StateContexts.reflex___state____state__integracion_minimal_web_page___states___stock_state____stock_state)





  
  return (
    <p>

{reflex___state____state__integracion_minimal_web_page___states___stock_state____stock_state.cantidad_activos}
</p>
  )
}

export function Div_8efe347d5e846ba2a2f7f938ec342f28 () {
  
  
                useEffect(() => {
                    ((...args) => (addEvents([(Event("reflex___state____state.integracion_minimal_web_page___states___stock_state____stock_state.fetch_cantidad_activos", ({  }), ({  })))], args, ({  }))))()
                    return () => {
                        
                    }
                }, []);
  const [addEvents, connectErrors] = useContext(EventLoopContext);





  
  return (
    <div>

<P_d1c4f46822db604f21686631d3493d85/>
<Fragment_c410719da887402f78ba4109549acfdd/>
</div>
  )
}

export default function Component() {
    




  return (
    <Fragment>

<Div_8efe347d5e846ba2a2f7f938ec342f28/>
<NextHead>

<title>

{"IntegracionMinimalWebPage | Index"}
</title>
<meta content={"favicon.ico"} property={"og:image"}/>
</NextHead>
</Fragment>
  )
}
