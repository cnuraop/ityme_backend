(window.webpackJsonp=window.webpackJsonp||[]).push([[0],{HxAg:function(e,t,i){"use strict";var s=i("HDdC"),n=i("pLZG");s.a.prototype.filter=function(e,t){return Object(n.a)(e,t)(this)}},YPVp:function(e,t,i){"use strict";i.d(t,"a",(function(){return c}));var s=i("kG/i"),n=i("QNOW"),o=i("fXoL"),r=i("CdOr");let c=(()=>{class e{constructor(e){this.coreService=e,this.loading=!1,this.settings={},this.commonSettings={edit:{editButtonContent:'<i class="nb-edit"></i>'},delete:{deleteButtonContent:'<i class="nb-trash"></i>',confirmDelete:!0},mode:"external",pager:{perPage:15},hideSubHeader:!1},this.actionSettings={actions:{columnTitle:"Action",position:"right",add:!1}}}ngOnInit(e){this.coreService.translationService.transformColumns(this.columns).subscribe(e=>{this.loadSettings(),this.loadColumns()}),this.source=new s.a(this.coreService.http,this.coreService.authService,e)}onDeleteConfirm(e){window.confirm("Are you sure you want to delete?")&&this.delete(e)}edit(e){this.coreService.router.navigate([this.editPageUrl,e.data.id])}delete(e){this.loading=!0,this.client.delete(e.data.id).subscribe(t=>{this.loading=!1,this.coreService.toastService.showToast(n.b.SUCCESS,"Deleted","Deleted successfully!"),this.source.remove(e.data)},e=>{this.loading=!1,this.coreService.toastService.showToast(n.b.DANGER,"Failed",e.error.message?e.error.message:"Unable to delete")})}loadColumns(){for(let e=0;e<this.columns.length;e++)this.settings.columns[this.columns[e].key]=this.columns[e].column}loadSettings(){this.settings=Object.assign(Object.assign(Object.assign({},this.commonSettings),this.actionSettings),{columns:{}})}}return e.\u0275fac=function(t){return new(t||e)(o["\u0275\u0275directiveInject"](r.a))},e.\u0275dir=o["\u0275\u0275defineDirective"]({type:e}),e})()},uotl:function(e,t,i){"use strict";i.d(t,"a",(function(){return s}));class s{}}}]);