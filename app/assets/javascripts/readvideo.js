

aalib.read.video.fromVideoElement(document.querySelector("video"))

  .pipe(aalib.aa({ width: 165, height: 68 }))
  .pipe(aalib.render.canvas({
      width: 696,
      height: 476,
      el: document.querySelector("#video-scene")
  }))
  .end();
