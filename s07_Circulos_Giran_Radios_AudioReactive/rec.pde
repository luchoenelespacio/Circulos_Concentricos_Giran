final String sketchname = getClass().getName();

import com.hamoid.*;
VideoExport videoExport;



String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

void recordVideo() {
  if (frameCount == 1) {
    videoExport = new VideoExport(this, "./export_video/"+sketchname+timestamp()+"_##.mp4");
    videoExport.setFrameRate(60);  
    videoExport.startMovie();
  }
  videoExport.saveFrame();
  println("Recording is ON | Frame: "+frameCount+" | FrameRate: "+frameRate);

 /*  if(key=='q'){
    videoExport.endMovie();
    println("VIDEO GRABADO");
    exit();
  } */
}
