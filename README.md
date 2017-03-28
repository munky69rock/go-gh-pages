go-gh-pages
====================

generate bookmarklet
--------------------

```sh
$ make
```

bookmarklets
------------


```javascript
javascript:"use strict";var _slicedToArray=function(){function sliceIterator(arr,i){var _arr=[];var _n=true;var _d=false;var _e=undefined;try{for(var _i=arr[Symbol.iterator](),_s;!(_n=(_s=_i.next()).done);_n=true){_arr.push(_s.value);if(i&&_arr.length===i)break}}catch(err){_d=true;_e=err}finally{try{if(!_n&&_i["return"])_i["return"]()}finally{if(_d)throw _e}}return _arr}return function(arr,i){if(Array.isArray(arr)){return arr}else if(Symbol.iterator in Object(arr)){return sliceIterator(arr,i)}else{throw new TypeError("Invalid attempt to destructure non-iterable instance")}}}();(function(){if(location.host!=="github.com"){alert("only available in github.com");return}var _location$href$match=location.href.match(/github.com\/([^\/]+)\/([^\/]+)/),_location$href$match2=_slicedToArray(_location$href$match,3),user=_location$href$match2[1],repos=_location$href$match2[2];location.href="https://"+user+".github.io/"+repos})();

```

