var A=Object.defineProperty,C=Object.defineProperties;var j=Object.getOwnPropertyDescriptors;var O=Object.getOwnPropertySymbols;var F=Object.prototype.hasOwnProperty,B=Object.prototype.propertyIsEnumerable;var M=(e,t,o)=>t in e?A(e,t,{enumerable:!0,configurable:!0,writable:!0,value:o}):e[t]=o,p=(e,t)=>{for(var o in t||(t={}))F.call(t,o)&&M(e,o,t[o]);if(O)for(var o of O(t))B.call(t,o)&&M(e,o,t[o]);return e},f=(e,t)=>C(e,j(t));import{R as b,M as _,j as i,s as w,m as k,u as D,a as N,b as L,F as R,A as P,r as l,c as Y}from"./vendor.948a392c.js";const H=function(){const t=document.createElement("link").relList;if(t&&t.supports&&t.supports("modulepreload"))return;for(const n of document.querySelectorAll('link[rel="modulepreload"]'))s(n);new MutationObserver(n=>{for(const r of n)if(r.type==="childList")for(const c of r.addedNodes)c.tagName==="LINK"&&c.rel==="modulepreload"&&s(c)}).observe(document,{childList:!0,subtree:!0});function o(n){const r={};return n.integrity&&(r.integrity=n.integrity),n.referrerpolicy&&(r.referrerPolicy=n.referrerpolicy),n.crossorigin==="use-credentials"?r.credentials="include":n.crossorigin==="anonymous"?r.credentials="omit":r.credentials="same-origin",r}function s(n){if(n.ep)return;n.ep=!0;const r=o(n);fetch(n.href,r)}};H();const x={},$={},S=({iconName:e,color:t})=>{const o=b.createElement(_[e]);return i("div",{style:{color:t,fontSize:`${x.ICON_SIZE}px`},children:o})},U=w.button`
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
`,Z=b.forwardRef(function({style:t,className:o,isOpen:s,onClick:n},r){return i(U,{ref:r,style:t,className:o,isOpen:s,colors:$,buttonsize:x.BUTTON_SIZE,onClick:n,children:i(S,{iconName:"MdAdd"})})}),G=()=>!window.invokeNative,z=()=>{},K=window.GetParentResourceName?window.GetParentResourceName():"nui-frame-app";async function g(e,t){if(!G())try{return await(await fetch(`https://${K}/${e}`,{method:"post",headers:{"Content-Type":"application/json; charset=UTF-8"},body:JSON.stringify(t)})).json()}catch(o){throw Error(`Failed to fetch NUI callback ${e}! (${o})`)}}function q(e,t,o,s){const n=o/s*e,r=t*Math.cos(Math.PI*2*(n-.25)),c=t*Math.sin(Math.PI*2*(n-.25)),d=e/2+.5;return`translate(${r}px, ${c}px) scale(${d})`}const J=w(k.div)`
  background-color: #333;
  color: white;
  font-size: 12px;
  padding: 4px 8px;
  line-height: 1.15;
  border-radius: 3px;
`,X=w(k.div)`
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
`;function Q({style:e,className:t,icon:o,onClick:s,label:n,index:r,totalItems:c}){const[d,m,a]=D({delayEnter:100,delayLeave:100}),{layerProps:u,triggerProps:E,renderLayer:v}=N({isOpen:d,placement:"top-center",auto:!0,containerOffset:16,triggerOffset:6});return L(R,{children:[i(X,f(p(f(p({},E),{className:t,style:e,onClick:s}),m),{itemsize:x.ITEM_SIZE,colors:$,initial:{x:0,opacity:0},animate:{x:1,opacity:1},exit:{x:0,opacity:0},transformTemplate:({x:h})=>{const y=parseFloat(h.replace("px",""));return q(y,x.RADIUS,r,c)},transition:{delay:r*.025,type:"spring",stiffness:600,damping:50,mass:1},children:i(S,{iconName:o})})),d&&v(i(P,{children:i(J,f(p({initial:{opacity:0},animate:{opacity:1},exit:{opacity:0}},u),{children:n}))}))]})}const V=w.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: ${e=>e.containersize}px;
  height: ${e=>e.containersize}px;
  pointer-events: none;
  border-radius: 50%;
`,T=b.forwardRef(function({style:t,setOpen:o,setRadialOpen:s,setItems:n,setHome:r,items:c},d){const m=a=>{a.shouldClose&&!a.submenu?(n([]),r([]),o(!1),s(!1),g("clickedItem",a).then().catch(u=>{console.error("Error on clickedItem",u)})):a.submenu?(n(a.submenu),setTimeout(()=>{o(!0)},500)):g("clickedItem",a).then().catch(u=>{console.error("Error on clickedItem",u)})};return i(V,{ref:d,style:t,onClick:()=>o(!1),containersize:x.CONTAINER_SIZE,children:c.map((a,u)=>i(Q,{icon:a.icon,label:a.label,onClick:()=>m(a),index:u,totalItems:c.length},u))})}),W=(e,t)=>{const o=l.exports.useRef(z);l.exports.useEffect(()=>{o.current=t},[t]),l.exports.useEffect(()=>{const s=n=>{const{action:r,data:c}=n.data;o.current&&r===e&&o.current(c)};return window.addEventListener("message",s),()=>window.removeEventListener("message",s)},[e])},ee=["Escape"],te=e=>{const t=l.exports.useRef(z);l.exports.useEffect(()=>{t.current=e},[e]),l.exports.useEffect(()=>{const o=s=>{ee.includes(s.code)&&(t.current(!1),g("hideFrame"))};return window.addEventListener("keydown",o),()=>window.removeEventListener("keydown",o)},[])},oe=()=>{const[e,t]=l.exports.useState(!1),[o,s]=l.exports.useState(!1),[n,r]=l.exports.useState([]),[c,d]=l.exports.useState([]);l.exports.useEffect(()=>{g("initialize").then(h=>{for(const[y,I]of Object.entries(h.size))x[y]=I;for(const[y,I]of Object.entries(h.colors))$[y]=I})},[]),W("openMenu",h=>{s(!0),d(h),setTimeout(v,200)}),te(()=>E());const{layerProps:m,triggerProps:a,renderLayer:u}=N({isOpen:e,placement:"center"}),E=()=>{r([]),s(!1),g("hideFrame"),t(!1)},v=()=>{e&&(r([]),s(!1),g("hideFrame")),t(!e)};return i(R,{children:o&&L(R,{children:[i(Z,f(p({className:"fixed m-auto inset-0"},a),{onClick:v,isOpen:e})),e&&u(i(P,{children:e&&n.length>0?i(T,f(p({},m),{setOpen:t,setItems:r,setHome:d,setRadialOpen:s,items:n})):i(T,f(p({},m),{setOpen:t,setItems:r,setHome:d,setRadialOpen:s,items:c}))}))]})})};Y.render(i(b.StrictMode,{children:i(oe,{})}),document.getElementById("root"));
