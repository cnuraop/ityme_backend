(window.webpackJsonp=window.webpackJsonp||[]).push([[18],{"o+pl":function(e,t,n){"use strict";n.r(t);var r=n("vTDv"),i=n("tyNb"),o=n("YPVp"),s=n("CdOr"),c=n("cUrp"),a=n("fXoL"),l=n("aceb"),d=n("RS3s"),p=n("sYmb");let u=(()=>{class e extends o.a{constructor(e,t,n){super(t),this.client=e,this.coreService=t,this.route=n,this.columns=[{key:"name",translation_key:"SUPPORT.FIELDS.NAME.LABEL",column:{title:"",type:"string"}},{key:"email",translation_key:"SUPPORT.FIELDS.EMAIL.LABEL",column:{title:"",type:"string"}},{key:"message",translation_key:"SUPPORT.FIELDS.MESSAGE.LABEL",column:{title:"",type:"string"}}],this.editPageUrl="pages/supports/edit",this.actionSettings={actions:{columnTitle:"Action",position:"right",add:!1,edit:!1}}}ngOnInit(){super.ngOnInit(this.client.getBaseEndpoint())}delete(e){super.delete(e)}}return e.\u0275fac=function(t){return new(t||e)(a["\u0275\u0275directiveInject"](c.a),a["\u0275\u0275directiveInject"](s.a),a["\u0275\u0275directiveInject"](i.a))},e.\u0275cmp=a["\u0275\u0275defineComponent"]({type:e,selectors:[["list"]],features:[a["\u0275\u0275InheritDefinitionFeature"]],decls:6,vars:6,consts:[["nbSpinnerStatus","danger",3,"nbSpinner"],[3,"settings","source","delete","edit"]],template:function(e,t){1&e&&(a["\u0275\u0275elementStart"](0,"nb-card"),a["\u0275\u0275elementStart"](1,"nb-card-header"),a["\u0275\u0275text"](2),a["\u0275\u0275pipe"](3,"translate"),a["\u0275\u0275elementEnd"](),a["\u0275\u0275elementStart"](4,"nb-card-body",0),a["\u0275\u0275elementStart"](5,"ng2-smart-table",1),a["\u0275\u0275listener"]("delete",(function(e){return t.onDeleteConfirm(e)}))("edit",(function(e){return t.edit(e)})),a["\u0275\u0275elementEnd"](),a["\u0275\u0275elementEnd"](),a["\u0275\u0275elementEnd"]()),2&e&&(a["\u0275\u0275advance"](2),a["\u0275\u0275textInterpolate1"](" ",a["\u0275\u0275pipeBind1"](3,4,"SUPPORT.LABELS.LIST")," "),a["\u0275\u0275advance"](2),a["\u0275\u0275property"]("nbSpinner",t.loading),a["\u0275\u0275advance"](1),a["\u0275\u0275property"]("settings",t.settings)("source",t.source))},directives:[l.o,l.q,l.n,l.bb,d.b],pipes:[p.c],styles:[".nb-theme-corporate   [_nghost-%COMP%]   nb-card[_ngcontent-%COMP%], .nb-theme-cosmic   [_nghost-%COMP%]   nb-card[_ngcontent-%COMP%], .nb-theme-dark   [_nghost-%COMP%]   nb-card[_ngcontent-%COMP%], .nb-theme-default   [_nghost-%COMP%]   nb-card[_ngcontent-%COMP%]{transform:translateZ(0)}"]}),e})();const m=[{path:"",component:(()=>{class e{}return e.\u0275fac=function(t){return new(t||e)},e.\u0275cmp=a["\u0275\u0275defineComponent"]({type:e,selectors:[["supports"]],decls:1,vars:0,template:function(e,t){1&e&&a["\u0275\u0275element"](0,"router-outlet")},directives:[i.h],encapsulation:2}),e})(),children:[{path:"list",component:u}]}];let g=(()=>{class e{}return e.\u0275mod=a["\u0275\u0275defineNgModule"]({type:e}),e.\u0275inj=a["\u0275\u0275defineInjector"]({factory:function(t){return new(t||e)},imports:[[i.g.forChild(m)],i.g]}),e})();n.d(t,"SupportsModule",(function(){return f}));let f=(()=>{class e{}return e.\u0275mod=a["\u0275\u0275defineNgModule"]({type:e}),e.\u0275inj=a["\u0275\u0275defineInjector"]({factory:function(t){return new(t||e)},imports:[[r.a,g]]}),e})()}}]);