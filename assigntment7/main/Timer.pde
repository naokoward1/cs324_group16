class Timer{
  float timer;
  int interval = 2000;
  float totalTime; float segmentTime; float elapsedTime;
  Timer(int interval){
    this.segmentTime = segmentTime;
    this.totalTime = totalTime;
    this.elapsedTime = elapsedTime;
    this.interval = interval;
    this.timer = millis();
  }
  float update(){
    if(!paused){
      this.segmentTime = millis() - timer;
    }
    this.totalTime = this.segmentTime + this.elapsedTime;
    return this.totalTime;
  }
  void pauseTimer(){
    paused = !paused;
    if(!paused){
      timer = millis();
      this.elapsedTime += this.segmentTime;
      this.segmentTime = 0;
    }
  }
}

   
    
