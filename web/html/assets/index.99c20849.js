var B=Object.defineProperty,F=Object.defineProperties;var j=Object.getOwnPropertyDescriptors;var E=Object.getOwnPropertySymbols;var D=Object.prototype.hasOwnProperty,_=Object.prototype.propertyIsEnumerable;var $=(e,t,n)=>t in e?B(e,t,{enumerable:!0,configurable:!0,writable:!0,value:n}):e[t]=n,p=(e,t)=>{for(var n in t||(t={}))D.call(t,n)&&$(e,n,t[n]);if(E)for(var n of E(t))_.call(t,n)&&$(e,n,t[n]);return e},f=(e,t)=>F(e,j(t));import{R as m,M as H,j as i,C as U,s as x,m as I,u as Y,a as R,b as M,F as w,A as k,r as u,c as Z}from"./vendor.9d313508.js";const G=function(){const t=document.createElement("link").relList;if(t&&t.supports&&t.supports("modulepreload"))return;for(const o of document.querySelectorAll('link[rel="modulepreload"]'))s(o);new MutationObserver(o=>{for(const r of o)if(r.type==="childList")for(const a of r.addedNodes)a.tagName==="LINK"&&a.rel==="modulepreload"&&s(a)}).observe(document,{childList:!0,subtree:!0});function n(o){const r={};return o.integrity&&(r.integrity=o.integrity),o.referrerpolicy&&(r.referrerPolicy=o.referrerpolicy),o.crossorigin==="use-credentials"?r.credentials="include":o.crossorigin==="anonymous"?r.credentials="omit":r.credentials="same-origin",r}function s(o){if(o.ep)return;o.ep=!0;const r=n(o);fetch(o.href,r)}};G();const O=({iconName:e,color:t})=>{const n=m.createElement(H[e]);return i("div",{style:{color:t},children:n})},K="#2ea09b",N="#268e89",L=56,q=U`
  &:hover {
    background-color: ${N};
    transform: scale(1.03);
  }
`,z=x.button`
  width: ${L}px;
  height: ${L}px;
  color: white;
  border: none;
  background-color: ${e=>e.isOpen?N:K};
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  outline: 0;
  cursor: pointer;
  transition: 0.2s ease-in-out;
  transform: scale(${e=>e.isOpen?1.03:1});

  ${e=>!e.isOpen&&q}

  & svg {
    transition: 0.25s ease-in-out;
    transform: rotate(${e=>e.isOpen?45:0}deg);
  }
`,J=m.forwardRef(function({style:t,className:n,isOpen:s,onClick:o},r){return i(z,{ref:r,style:t,className:n,isOpen:s,onClick:o,children:i(O,{iconName:"MdAdd"})})}),P=48,b=120,X=b/2,Q="#2ea09b",V="#dadada",W="#656565",ee=()=>!window.invokeNative,T=()=>{},te=window.GetParentResourceName?window.GetParentResourceName():"nui-frame-app";async function g(e,t){if(!ee())try{return await(await fetch(`https://${te}/${e}`,{method:"post",headers:{"Content-Type":"application/json; charset=UTF-8"},body:JSON.stringify(t)})).json()}catch(n){throw Error(`Failed to fetch NUI callback ${e}! (${n})`)}}function ne(e,t,n,s){const o=n/s*e,r=t*Math.cos(Math.PI*2*(o-.25)),a=t*Math.sin(Math.PI*2*(o-.25)),l=e/2+.5;return`translate(${r}px, ${a}px) scale(${l})`}const oe=x(I.div)`
  background-color: #333;
  color: white;
  font-size: 12px;
  padding: 4px 8px;
  line-height: 1.15;
  border-radius: 3px;
`,re=x(I.div)`
  position: absolute;
  width: ${P}px;
  height: ${P}px;
  background-color: white;
  border-radius: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
  border: 1px solid ${V};
  box-shadow: 1px 1px 6px 0px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  transition: box-shadow 0.15s ease-in-out, border 0.15s ease-in-out;
  color: ${W};
  pointer-events: all;
  will-change: transform;

  & svg {
    transition: 0.15s ease-in-out;
  }

  &:hover {
    box-shadow: 1px 1px 10px 0px rgba(0, 0, 0, 0.15);
    color: ${Q};

    & svg {
      transform: scale(1.15);
    }
  }
`;function se({style:e,className:t,icon:n,onClick:s,label:o,index:r,totalItems:a}){const[l,h,c]=Y({delayEnter:100,delayLeave:100}),{layerProps:d,triggerProps:y,renderLayer:v}=R({isOpen:l,placement:"top-center",auto:!0,containerOffset:16,triggerOffset:6});return M(w,{children:[i(re,f(p(f(p({},y),{className:t,style:e,onClick:s}),h),{initial:{x:0,opacity:0},animate:{x:1,opacity:1},exit:{x:0,opacity:0},transformTemplate:({x:S})=>{const C=parseFloat(S.replace("px",""));return ne(C,X,r,a)},transition:{delay:r*.025,type:"spring",stiffness:600,damping:50,mass:1},children:i(O,{iconName:n})})),l&&v(i(k,{children:i(oe,f(p({initial:{opacity:0},animate:{opacity:1},exit:{opacity:0}},d),{children:o}))}))]})}const ie=x.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: ${b}px;
  height: ${b}px;
  pointer-events: none;
  border-radius: 50%;
`,A=m.forwardRef(function({style:t,setOpen:n,setRadialOpen:s,setItems:o,setHome:r,items:a},l){const h=c=>{c.shouldClose&&!c.submenu?(o([]),r([]),n(!1),s(!1),g("clickedItem",c).then().catch(d=>{console.error("Error on clickedItem",d)})):c.submenu?(o(c.submenu),setTimeout(()=>{n(!0)},500)):(o([]),r([]),s(!1),g("clickedItem",c).then().catch(d=>{console.error("Error on clickedItem",d)}))};return i(ie,{ref:l,style:t,onClick:()=>n(!1),children:a.map((c,d)=>i(se,{icon:c.icon,label:c.label,onClick:()=>h(c),index:d,totalItems:a.length},d))})}),ae=(e,t)=>{const n=u.exports.useRef(T);u.exports.useEffect(()=>{n.current=t},[t]),u.exports.useEffect(()=>{const s=o=>{const{action:r,data:a}=o.data;n.current&&r===e&&n.current(a)};return window.addEventListener("message",s),()=>window.removeEventListener("message",s)},[e])},ce=["Escape"],le=e=>{const t=u.exports.useRef(T);u.exports.useEffect(()=>{t.current=e},[e]),u.exports.useEffect(()=>{const n=s=>{ce.includes(s.code)&&(t.current(!1),g("hideFrame"))};return window.addEventListener("keydown",n),()=>window.removeEventListener("keydown",n)},[])},de=()=>{const[e,t]=u.exports.useState(!1),[n,s]=u.exports.useState(!1),[o,r]=u.exports.useState([]),[a,l]=u.exports.useState([]);ae("openMenu",v=>{s(!0),l(v)}),le(s);const{layerProps:h,triggerProps:c,renderLayer:d}=R({isOpen:e,placement:"center"}),y=()=>{e&&(r([]),s(!1),g("hideFrame")),t(!e)};return i(w,{children:n&&M(w,{children:[i(J,f(p({className:"fixed m-auto inset-0"},c),{onClick:y,isOpen:e})),e&&d(i(k,{children:e&&o.length>0?i(A,f(p({},h),{setOpen:t,setItems:r,setHome:l,setRadialOpen:s,items:o})):i(A,f(p({},h),{setOpen:t,setItems:r,setHome:l,setRadialOpen:s,items:a}))}))]})})};Z.render(i(m.StrictMode,{children:i(de,{})}),document.getElementById("root"));
