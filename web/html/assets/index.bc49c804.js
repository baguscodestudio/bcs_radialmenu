var A=Object.defineProperty,T=Object.defineProperties;var j=Object.getOwnPropertyDescriptors;var $=Object.getOwnPropertySymbols;var C=Object.prototype.hasOwnProperty,B=Object.prototype.propertyIsEnumerable;var M=(e,t,o)=>t in e?A(e,t,{enumerable:!0,configurable:!0,writable:!0,value:o}):e[t]=o,p=(e,t)=>{for(var o in t||(t={}))C.call(t,o)&&M(e,o,t[o]);if($)for(var o of $(t))B.call(t,o)&&M(e,o,t[o]);return e},f=(e,t)=>T(e,j(t));import{R as b,M as F,j as i,s as w,m as O,u as _,a as k,b as N,F as I,A as L,r as l,c as D}from"./vendor.948a392c.js";const Y=function(){const t=document.createElement("link").relList;if(t&&t.supports&&t.supports("modulepreload"))return;for(const n of document.querySelectorAll('link[rel="modulepreload"]'))s(n);new MutationObserver(n=>{for(const r of n)if(r.type==="childList")for(const c of r.addedNodes)c.tagName==="LINK"&&c.rel==="modulepreload"&&s(c)}).observe(document,{childList:!0,subtree:!0});function o(n){const r={};return n.integrity&&(r.integrity=n.integrity),n.referrerpolicy&&(r.referrerPolicy=n.referrerpolicy),n.crossorigin==="use-credentials"?r.credentials="include":n.crossorigin==="anonymous"?r.credentials="omit":r.credentials="same-origin",r}function s(n){if(n.ep)return;n.ep=!0;const r=o(n);fetch(n.href,r)}};Y();const x={},R={},P=({iconName:e,color:t})=>{const o=b.createElement(F[e]);return i("div",{style:{color:t,fontSize:`${x.ICON_SIZE}px`},children:o})},U=w.button`
  width: ${e=>e.buttonsize}px;
  height: ${e=>e.buttonsize}px;
  color: white;
  border: none;
  background-color: ${e=>e.isOpen?e.colors.PRIMARY_2:e.colors.PRIMARY};
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  outline: 0;
  cursor: pointer;
  transition: 0.2s ease-in-out;
  transform: scale(${e=>e.isOpen?1.03:1});

  &:hover {
    background-color: ${e=>e.colors.PRIMARY_2};
    transform: scale(1.03);
  }

  & svg {
    transition: 0.25s ease-in-out;
    transform: rotate(${e=>e.isOpen?45:0}deg);
  }
`,Z=b.forwardRef(function({style:t,className:o,isOpen:s,onClick:n},r){return i(U,{ref:r,style:t,className:o,isOpen:s,colors:R,buttonsize:x.BUTTON_SIZE,onClick:n,children:i(P,{iconName:"MdAdd"})})}),H=()=>!window.invokeNative,S=()=>{},G=window.GetParentResourceName?window.GetParentResourceName():"nui-frame-app";async function v(e,t){if(!H())try{return await(await fetch(`https://${G}/${e}`,{method:"post",headers:{"Content-Type":"application/json; charset=UTF-8"},body:JSON.stringify(t)})).json()}catch(o){throw Error(`Failed to fetch NUI callback ${e}! (${o})`)}}function K(e,t,o,s){const n=o/s*e,r=t*Math.cos(Math.PI*2*(n-.25)),c=t*Math.sin(Math.PI*2*(n-.25)),u=e/2+.5;return`translate(${r}px, ${c}px) scale(${u})`}const q=w(O.div)`
  background-color: #333;
  color: white;
  font-size: 12px;
  padding: 4px 8px;
  line-height: 1.15;
  border-radius: 3px;
`,J=w(O.div)`
  position: absolute;
  width: ${e=>e.itemsize}px;
  height: ${e=>e.itemsize}px;
  background-color: white;
  border-radius: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
  border: 1px solid ${e=>e.colors.BORDER};
  box-shadow: 1px 1px 6px 0px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  transition: box-shadow 0.15s ease-in-out, border 0.15s ease-in-out;
  color: ${e=>e.colors.TEXT};
  pointer-events: all;
  will-change: transform;

  & svg {
    transition: 0.15s ease-in-out;
  }

  &:hover {
    box-shadow: 1px 1px 10px 0px rgba(0, 0, 0, 0.15);
    color: ${e=>e.colors.PRIMARY};

    & svg {
      transform: scale(1.15);
    }
  }
`;function X({style:e,className:t,icon:o,onClick:s,label:n,index:r,totalItems:c}){const[u,h,a]=_({delayEnter:100,delayLeave:100}),{layerProps:d,triggerProps:E,renderLayer:m}=k({isOpen:u,placement:"top-center",auto:!0,containerOffset:16,triggerOffset:6});return N(I,{children:[i(J,f(p(f(p({},E),{className:t,style:e,onClick:s}),h),{itemsize:x.ITEM_SIZE,colors:R,initial:{x:0,opacity:0},animate:{x:1,opacity:1},exit:{x:0,opacity:0},transformTemplate:({x:g})=>{const y=parseFloat(g.replace("px",""));return K(y,x.RADIUS,r,c)},transition:{delay:r*.025,type:"spring",stiffness:600,damping:50,mass:1},children:i(P,{iconName:o})})),u&&m(i(L,{children:i(q,f(p({initial:{opacity:0},animate:{opacity:1},exit:{opacity:0}},d),{children:n}))}))]})}const Q=w.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: ${e=>e.containersize}px;
  height: ${e=>e.containersize}px;
  pointer-events: none;
  border-radius: 50%;
`,z=b.forwardRef(function({style:t,setOpen:o,setRadialOpen:s,setItems:n,setHome:r,items:c},u){const h=a=>{a.shouldClose&&!a.submenu?(n([]),r([]),o(!1),s(!1),v("clickedItem",a).then().catch(d=>{console.error("Error on clickedItem",d)})):a.submenu?(n(a.submenu),setTimeout(()=>{o(!0)},500)):(n([]),r([]),s(!1),v("clickedItem",a).then().catch(d=>{console.error("Error on clickedItem",d)}))};return i(Q,{ref:u,style:t,onClick:()=>o(!1),containersize:x.CONTAINER_SIZE,children:c.map((a,d)=>i(X,{icon:a.icon,label:a.label,onClick:()=>h(a),index:d,totalItems:c.length},d))})}),V=(e,t)=>{const o=l.exports.useRef(S);l.exports.useEffect(()=>{o.current=t},[t]),l.exports.useEffect(()=>{const s=n=>{const{action:r,data:c}=n.data;o.current&&r===e&&o.current(c)};return window.addEventListener("message",s),()=>window.removeEventListener("message",s)},[e])},W=["Escape"],ee=e=>{const t=l.exports.useRef(S);l.exports.useEffect(()=>{t.current=e},[e]),l.exports.useEffect(()=>{const o=s=>{W.includes(s.code)&&(t.current(!1),v("hideFrame"))};return window.addEventListener("keydown",o),()=>window.removeEventListener("keydown",o)},[])},te=()=>{const[e,t]=l.exports.useState(!1),[o,s]=l.exports.useState(!1),[n,r]=l.exports.useState([]),[c,u]=l.exports.useState([]);l.exports.useEffect(()=>{v("initialize").then(m=>{for(const[g,y]of Object.entries(m.size))x[g]=y;for(const[g,y]of Object.entries(m.colors))R[g]=y})},[]),V("openMenu",m=>{s(!0),u(m)}),ee(s);const{layerProps:h,triggerProps:a,renderLayer:d}=k({isOpen:e,placement:"center"}),E=()=>{e&&(r([]),s(!1),v("hideFrame")),t(!e)};return i(I,{children:o&&N(I,{children:[i(Z,f(p({className:"fixed m-auto inset-0"},a),{onClick:E,isOpen:e})),e&&d(i(L,{children:e&&n.length>0?i(z,f(p({},h),{setOpen:t,setItems:r,setHome:u,setRadialOpen:s,items:n})):i(z,f(p({},h),{setOpen:t,setItems:r,setHome:u,setRadialOpen:s,items:c}))}))]})})};D.render(i(b.StrictMode,{children:i(te,{})}),document.getElementById("root"));
