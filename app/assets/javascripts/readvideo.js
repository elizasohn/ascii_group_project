function waitForLoad(id, callback){
    var timer = setInterval(function(){
        if(document.getElementById(id)){
            clearInterval(timer);
            callback();
        }
    }, 100);
}

waitForLoad("subm", function(){
    console.log("load successful, you can proceed!!");
    document.getElementById("subm").onclick = function()
    {
        alert("I got clicked");
    }
});

aalib.read.video.fromVideoElement(document.querySelector("video"))

  .pipe(aalib.aa({ width: 165, height: 68 }))
  .pipe(aalib.render.canvas({
      width: 696,
      height: 476,
      el: document.querySelector("#video-scene")
  }))
  .end();
